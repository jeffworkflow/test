local mt = ac.buff['英雄回城']

mt.keep = true

--每层增加的移动速度(%)
mt.move_rate = 5

--最大叠加层数
mt.max_stack = 10

mt.pulse = 1

function mt:on_add()
	
end

function mt:on_remove()
	
end

function mt:on_pulse()
	self:on_add()
end

function mt:on_cover(dest)
	return false
end
