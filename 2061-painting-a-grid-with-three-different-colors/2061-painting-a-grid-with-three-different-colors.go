// Complexity:
// Time O(8^m * Log(n)) and Space O(4^m).
func colorTheGrid(m int, n int) int {
	if m > 5 {
		panic("the problem constraints have been changed; review required")
	}

	if n == 1 {
		return 3 * (1 << (m - 1))
	}

	const MODULE = 1_000_000_007

	A := buildTransitionMatrx(m)  // symmetric
	A = matrixPow(A, n-1, MODULE) // symmetric

	result := int64(0)
	for i := range *A {
		for j := range i {
			result = (result + 2*(*A)[i][j]) % MODULE
		}
		result = (result + (*A)[i][i]) % MODULE
	}
	return int(result)
}

// `buildTransitionMatrix` returns a transition matrix that transitions the state
// from when n equals i to i+1. Here, the state refers to the counts of different
// color arrangements of an m x n matrix with a specific last-column coloring,
// covering all possible last-column colorings.
func buildTransitionMatrx(m int) *[][]int64 {
	allRows := generateAllColorRows(m)

	result := make([][]int64, len(allRows))
	for i := range result {
		result[i] = make([]int64, len(allRows))
	}

	for i := range allRows {
		for j := range i + 1 {
			if areRowsCompatible(allRows[i], allRows[j], m) {
				result[i][j] = 1
				result[j][i] = 1
			}
		}
	}
	return &result
}

// `generateAllColorRows` returns a list of all possible color arrangements
// of a row of length m. The colors are encoded using the lowest 2m bits,
// with each color takes 2 bits.
func generateAllColorRows(m int) []int {
	finalSize := 3 * (1 << (m - 1))
	result := make([]int, finalSize)
	mask := 0b11

	result[0], result[1], result[2] = 0, 1, 2
	for size := 3; size < finalSize; size *= 2 {
		j := size*2 - 1
		for i := size - 1; i >= 0; i-- {
			base := result[i] << 2
			lastColor := result[i] & mask
			for color := range 3 {
				if color != lastColor {
					result[j] = base | color
					j--
				}
			}
		}
	}
	return result
}

// `areRowsCompatible` returns whether the rows (bit-encoded) can be placed
// adjancent to each other.
func areRowsCompatible(row1, row2, m int) bool {
	mask := 0b11
	for range m {
		if row1&mask == row2&mask {
			return false
		}
		mask <<= 2
	}
	return true
}

func matrixPow(mat *[][]int64, power int, module int64) *[][]int64 {
	if power <= 0 {
		panic("unsupported power value")
	}
	if power == 1 {
		return mat
	}

	result := matrixPow(matrixMul(mat, mat, module), power>>1, module)
	if power&1 == 1 {
		result = matrixMul(result, mat, module)
	}
	return result
}

func matrixMul(a, b *[][]int64, module int64) *[][]int64 {
	if len((*a)[0]) != len(*b) {
		panic("Incompatible matrix shapes")
	}
	m := len(*a)
	n := len((*b)[0])

	result := make([][]int64, m)
	for i := range m {
		result[i] = make([]int64, n)
	}

	for i := range m {
		for j := range n {
			for k := range len(*b) {
				result[i][j] = (result[i][j] + (*a)[i][k]*(*b)[k][j]) % module
			}
		}
	}
	return &result
}