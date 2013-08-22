class ShoeSweeper < ActionController::Caching::Sweeper
  observe Shoe

  def after_update(shoe)
  	expire_shoe_page(shoe)
  end

  def after_destroy(shoe)
  	expire_shoe_page(shoe)
  end

  private
  def expire_book_page(shoe)
  	expire_page(controller: "publics", action: "shoe", id: shoe.id)
  	expire_fragment(controller: "publics", action: "index")
  end
end