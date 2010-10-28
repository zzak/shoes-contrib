Shoes.app :title => "shoes-contrib browser", :height => 75, :width => 355 do
  stack do
    flow do
      para "Choose a category:"
      @category_box = list_box :items => %w[animation app art basic elements events kernel manipulation position styles]
    end
    @example_flow = flow :hidden => true do
      para "Choose an example:"
      @example_box = list_box :items => []
    end

    @category_box.change do |box|
      @example_flow.style :hidden => false
      @example_box.items = Dir.glob("#{box.text}/*.rb")
    end

    @example_box.change do |box|
      #simply requiring something with a Shoes.app will run it!
      require box.text
    end
  end
end
