local std_print = print

function print(...)
	std_print(('[%.3f]'):format(os.clock()), ...)
end

local function main()
	local console = require 'jass.console'
	console.enable = true
	print 'hello loli!'
	--print ('package.path = ', package.path)

	require 'war3.id'
	require 'war3.api'
	require 'util.log'
	require 'ac.init'
	require 'util.error'

	local runtime = require 'jass.runtime'
	if runtime.perftrace then
		runtime.perftrace()
		ac.loop(10000, function()
			log.info('perftrace', runtime.perftrace())
		end)
	end

	ac.lni_loader('unit')

	local rect		= require 'types.rect'
	local circle	= require 'types.circle'
	local region	= require 'types.region'
	local effect	= require 'types.effect'
	local fogmodifier	= require 'types.fogmodifier'
	local move		= require 'types.move'
	local unit		= require 'types.unit'
	local attribute	= require 'types.attribute'
	local hero		= require 'types.hero'
	local damage	= require 'types.damage'
	local heal		= require 'types.heal'
	local mover		= require 'types.mover'
	local follow	= require 'types.follow'
	local texttag	= require 'types.texttag'
	local lightning	= require 'types.lightning'
	local path_block	= require 'types.path_block'
	local item		= require 'types.item'
	local game		= require 'types.game'
	local shop		= require 'types.shop'
	local sound		= require 'types.sound'
	local sync		= require 'types.sync'
	local response	= require 'types.response'
	local record	= require 'types.record'
	
	
	--初始化
	rect.init()
	damage.init()
	move.init()
	unit.init()
	hero.init()
	effect.init()
	mover.init()
	follow.init()
	lightning.init()
	texttag.init()
	shop.init()
	path_block.init()
	game.init()

	game.register_observer('hero move', move.update)
	game.register_observer('mover move', mover.move)
	game.register_observer('path_block', path_block.update)
	game.register_observer('follow move', follow.move)
	game.register_observer('lightning', lightning.update)
	game.register_observer('texttag', texttag.update)
	game.register_observer('mover hit', mover.hit)

	require 'war3.target_data'
	require 'war3.order_id'

	--测试
	local test = require 'test.init'
	local jass = require 'jass.common'
	test.init()

	
	--单位获得物品事件
	local j_trg = war3.CreateTrigger(function()
		local u = unit.j_unit(jass.GetTriggerUnit())
		if not u then
			return
		end
		local it = jass.GetManipulatedItem()
		--print('被操作的物品:',it)
		if not it then
			return
		end
		u.owner:event_notify('单位-获得物品', u.owner, it)
	end)
	for i = 1, 13 do
		jass.TriggerRegisterPlayerUnitEvent(j_trg, ac.player[i].handle, jass.EVENT_PLAYER_UNIT_PICKUP_ITEM, nil)
	end
	
	
    --单位获得物品 - 回调
	ac.game:event '单位-获得物品' (function(trg, hero, it)
		--print_r(it)
	--	print('单位-获得物品:',it)
	--	print(it)
	end)

    --单位丢弃物品 - 回调
	ac.game:event '单位-丢弃物品' (function(trg, hero, it)
	--	print('单位-丢弃物品:',it)
	--	print(it.handle)
	end)

	
	--游戏
	--local map = require 'maps.map'
	local map = require 'jf.map'
	require 'jf.hero.init'

	--保存预设单位
	unit.saveDefaultUnits()

	--print_r(unit)
	map.init()

    local hero2 = test.helper:dummy('小矮人',10000, 1);
    hero2:set_level(4);
    -- local hero_data = hero.hero_list['小矮人'].data
	-- ac.player[1]:create_unit(hero_data.id,ac.point(0,0,0))

    -- local hero = test.helper:dummy('丹特丽安',10000, 1);
	-- --hero:add_restriction '阿卡林'
	-- --local hero = test.helper:dummy('小矮人',10000, 2);
	-- --hero:set_high(10000)

	-- --test.helper:timer()
	-- local j_it = jass.CreateItem(base.string2id 'IT10', 0, 0)

	-- print(hero.handle)
	-- print(j_it)
	
	-- hero:event '单位-发布指令' (function(_, hero, order, target)
	-- 	if order == 'smart' and target ~= nil then 
	-- 	   jass.UnitAddItem(hero.handle, target)
	-- 	end
	-- end	)

	-- --dbg.handle_ref(j_it)
	-- jass.UnitAddItem(hero.handle, j_it)

	print('读取lua 定义lni数据：',ac.lni.unit['萌物A'])
	print('读取lua 定义lni数据：',ac.lni.unit['火元素'])
	local slk = require 'jass.slk'
	for k, v in pairs(slk.misc.Misc) do
		print(k .. ' ' .. v)
	end

	local  last_formula =  slk.misc.Misc.NeedHeroXPFormulaA --上一个值因素
	local  lv_formula =  slk.misc.Misc.NeedHeroXPFormulaB --等级因素
	local  regular_formula =  slk.misc.Misc.NeedHeroXPFormulaC --固定因素

--     设EXP(N)为N级怪物的附带经验值，则
-- EXP(N)=EXP(N-1)*上一个值因素 + N*等级因素 + 固定因素
  -- upgrade_exp
   
   function init_lv_exp()
       
   end	
   function cal_lv_exp()
       
   end	
   function get_heroexp()

   end	
   function get_herolvexp(lv)
        
   end
-- 英雄的附带经验参数在"英雄EXP获取 - 英雄"中设置，计算方法和上面一样。
-- 所以，默认的经验获得公式如下：
-- 普通：N>=2时,EXP(N)=EXP(N-1)+5N+5; EXP(1)=25
-- 英雄：N>=6时,EXP(N)=EXP(N-1)+100; 5级以内按表排列


--需要 当前人物等级 ，当前已拥有经验值，  当前升级所需总经验值。
	
	-- local shop = ac.player[1]:create_unit('h001', rect.j_rect 'army_m1')
	
	-- shop:set_size(6)
	-- shop:add_restriction '无敌' 

	-- --shop:remove_ability 'Amov' --禁止商店移动
	-- shop:add_ability 'AInv'

	-- shop:add_ability 'Asid' --添加出售物品
	-- shop:add_ability 'Apit' --添加商店购物
	-- shop:add_ability 'A01G' --添加选择英雄

	-- hero:add_ability 'Asid' 
	-- -- shop:add_ability 'AHtb' --添加风暴之锤
	-- -- shop:add_ability 'Aply' --添加变羊术
	
	
	-- jass.AddItemToStock(shop.handle,base.string2id 'texp', 10, 10) --添加10个经验之书
	-- jass.AddItemToStock(shop.handle,base.string2id 'IT10', 10, 10) --添加10个经验之书
	-- jass.AddItemToStock(shop.handle,base.string2id 'texp', 10, 10) --添加10个经验之书
	-- jass.AddItemToStock(hero.handle,base.string2id 'texp', 10, 10) --添加10个经验之书
	-- -- jass.AddItemToStock(hero,base.string2id 'texp', 10, 10) --添加10个经验之书
	-- jass.AddItemToStock(hero.handle,base.string2id 'texp', 10, 10) --添加10个经验之书
	-- jass.AddItemToStock(hero.handle,base.string2id 'Aply', 10, 10) --添加10个经验之书

   	-- hero:blink(hero:getBornPoint()) --传送英雄到出生点
	-- ac.player(1):setCamera(hero) --切换镜头为 hero 所在区域
	-- --加载热补丁
	-- require 'types.hot_fix'


	local jass = require 'jass.common'
	jass.SetMapFlag(8192 * 2, true)
end

main()
