def max_candies(status, candies, keys, contained_boxes, initial_boxes)
  candy_count = 0
  keys_we_have = Set.new

  box_open=->(id) { status[id]==1 || keys_we_have.include?(id) }
  reorder_queue=->(q) { q.partition {|x| box_open.call(x) }.flatten}
  box_queue = initial_boxes

  until box_queue.empty? 
    # reorder and put open boxes to front, if front is not already open
    box_queue=reorder_queue.call(box_queue) unless box_open.call(box_queue.first)
    return candy_count unless box_open.call(box_queue.first) # if still no open box in front, return candy count
    
    box_id = box_queue.shift # use and discard the open box
    keys_we_have |= keys[box_id]
    candy_count+=candies[box_id]
    box_queue += contained_boxes[box_id]
  end

  candy_count  
end