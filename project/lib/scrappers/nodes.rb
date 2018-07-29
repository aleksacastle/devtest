module Nodes
  def count_nodes(page)
    page.css('*').length/100
  end
end
