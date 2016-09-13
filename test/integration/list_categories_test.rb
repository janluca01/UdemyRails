require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

		def setup
			@category = Category.create(name: "books")
			@category2 = Category.create(name: "coding")
		end

		test "get listing" do
			get categories_path
			assert_template 'categories/index'
			assert_select "a[href=?]", category_path(@category), text: @category.name
			assert_select "a[href=?]", category_path(@category2), text: @category2.name
		end
			
	

end