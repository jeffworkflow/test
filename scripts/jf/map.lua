rawset(_G, 'poi', {})

--require 'jf.tower.防御塔-强化'

local map = {}
local fogmodifier = require 'types.fogmodifier'

map.map_name = 'demo1'

ac.game:event '游戏-开始' (function()
	--刷兵
	local army = require 'jf.army'

	--army.init()
	
	--启用计时
	local gamet = require 'jf.rule.gametime'
	gamet.gt() 
end)

function map.init()
	--加载地图规则
	require 'jf.rule.init'
    

	--注册不可通行区域
	--map.pathRegionInit()
	--print("2")

	--注册瀑布机制
	--local spring = require 'jf.spring'
	--spring.init()
	--print("1")
	ac.game:event_notify('游戏-开始')
	--print("不调用游戏开始，进行测试")

	
    --测试
	--local testing = require 'jf.testing.init'
	--testing.init()
    --require 'jf.exeroom.init'

	--exeroom.init()
	--注册野怪
	--local creeps = require 'jf.creeps'
	--creeps.init()

	--注册防御塔
	--require 'jf.tower.init'

	--注册英雄
	require 'jf.hero.init'

	fogmodifier.create(ac.player[1], map.rects['test'])
	for i = 1, 10 do
	    local u = ac.player[6]:create_unit('h001',map.rects['test']);
	    u:add('生命上限', 10000)
    end
	--注册物品
	-- require 'jf.map_item._init'

	--注册商店
	-- require 'jf.map_shop.init'
	
    --等待选人结束
	--require 'jf.choose_hero.init'
	--注册智能施法
	require 'jf.smart_cast.init'

	-- local rect = require 'types.rect'
    -- print_r(rect.j_rect 'army_m1');
	-- local u = ac.player.com[1]:create_unit('萌物A', rect.j_rect 'army_m1')
	-- u:set_size(4)
	-- u:add_restriction '无敌' 
	
	-- ac.loop(1000,function()
	-- 	--print(1)
	-- 	u = ac.player[1]:create_unit('少女A',ac.point(0,0,0))
	-- 	u = ac.player[2]:create_unit('少女B',ac.point(0,0,0))
	-- 	u.reward_gold = 35
	-- 	u.reward_exp = 1880
	-- end)

	-- local product_army = ac.loop(100000,function(t)
    
	-- 	--rect['练功房'] = {}
	-- 	--print(exeroom_region.unit_group[0])
	-- 	--exeroom_region.unit_group:ForGroup(alive_remove)
		
		
	-- 	--if exeroom_region.unit_group[0] <=2 then 
	-- 	local t = ac.timer(20,100, function()
	-- 		local u = ac.player.com[1]:create_unit('少女A',ac.point(0,0,0))
	-- 		local u = ac.player.com[2]:create_unit('少女B',ac.point(0,0,0))
	-- 		-- u.reward_gold = 35
	-- 		-- u.reward_exp = 80
	-- 		--table.insert(rect['练功房'],u)
	-- 	end)
	-- 	t:on_timer()
			
	-- 	--end	
	-- 	--print(exeroom_region.unit_count)
	-- end)
	-- product_army:on_timer()	

end

return map
