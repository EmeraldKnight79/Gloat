module GankSessionsHelper
  def item_icon(item_name, count=1, quality=0)
    "https://gameinfo.albiononline.com/api/gameinfo/items/#{item_name}.png?count=#{count}&quality=#{quality}"
  end
end
