local shop = require 'types.shop'

require 'jf.map_shop.page'
require 'jf.map_shop.affix'

ac.game:event '玩家-注册英雄' (function(_, player)
	local unit
	if player:get_team() == 1 then
		print('创建商店',player)
		unit = shop.create(player, '商店A', 'shop_', 315)
		unit:set_size(4)
	else
		unit = shop.create(player, '商店B', 'shop_', 225)
		unit:set_size(4)
	end
end)
