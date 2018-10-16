require 'jf.hero.com_skill.init'
require 'jf.hero.小矮人.爆裂火球'

return ac.hero.create '小矮人'
{
	--物编中的id
	id = 'H00B',

	production = 'war3',

	model_source = '风潮网络',

	hero_designer = 'war3',

	hero_scripter = 'jeff',

	show_animation = { 'attack slam', 'spell channel' },

	--技能数量
	skill_count = 6,

	skill_names = '爆裂火球 霜冻攻击 快速攻击  生命成长 多重锤-直线' ,

	attribute = {
		['生命上限'] = 1000,
		['魔法上限'] = 600,
		['生命恢复'] = 3.5,
		['魔法恢复'] = 1.1,
		['魔法脱战恢复'] = 0,
		['攻击']    = 1,
		['护甲']    = 13333,
		['移动速度'] = 310,
		['攻击间隔'] = 1.1,
		['攻击范围'] = 1000,
	},

	upgrade = {
		['生命上限'] = 125,
		['魔法上限'] = 30,
		['生命恢复'] = 0.25,
		['魔法恢复'] = 0.1,
		['攻击']    = 1.3,
		['护甲']    = 1.3,
	},

	weapon = {
		--['弹道模型'] = [[GryphonRiderMissile2.mdx]],
		['弹道模型'] = [[StarDust.mdx]],
		
	    --['弹道模型'] = [[Abilities\Spells\Other\BlackArrow\BlackArrowMissile.mdl]],
		['弹道速度'] = 900,
		['弹道弧度'] = 0,
		['弹道出手'] = {15, 0, 66},
		['弹道数量'] = 3,
	},

	difficulty = 1,

	--选取半径
	selected_radius = 32,
}
