ac = {}
ac.game = {}

require 'ac.utility'
require 'ac.lni'
require 'ac.point'
require 'ac.math'
--require 'ac.vector'
require 'ac.trigger'
require 'ac.event'
require 'ac.player'
require 'ac.unit'
require 'ac.selector'
require 'ac.timer'
require 'ac.buff'
require 'ac.skill'
require 'ac.template_skill'
require 'ac.resource'

require 'ac.buff.init'

function print_r (lua_table, indent)

    indent = indent or 0
    for k, v in pairs(lua_table) do
        if type(k) == "string" then
            k = string.format("%q", k)
        end
        local szSuffix = ""
        if type(v) == "table" then
            szSuffix = "{"
        end
        local szPrefix = string.rep("    ", indent)
        formatting = szPrefix.."["..k.."]".." = "..szSuffix
        if type(v) == "table" then
            print(formatting)
            print_r(v, indent + 1)
            print(szPrefix.."},")
        else
            local szValue = ""
            if type(v) == "string" then
                szValue = string.format("%q", v)
            else
                szValue = tostring(v)
            end
            print(formatting..szValue..",")
        end
    end
end


function watch(maxLevel,argv)
	local already, ostream = {}, {};
	
	local function _tostring(maxLevel, obj)
	    local vtype = type(obj);
		--print(vtype)
		--print(obj)
		if vtype == 'table'  and  maxLevel > 0 and not already[obj] then
			local o = {};
			
			already[obj] = true;
			pcall(function()
				for k, v in pairs(obj) do
				  if type(k) == "number" then 
					 --print(1)
					 table.insert(o,_tostring(maxLevel-1,v));
				  else
					 table.insert(o, "".._tostring(maxLevel-1,k).."=".._tostring(maxLevel-1,v));
				  end			
				end 
			end);
			return "{"..table.concat(o, ",").."}";
		elseif vtype == 'string' then
			    --print('"'..obj..'"')
				return '"'..obj..'"';
		elseif vtype == 'function' then
			    --print(tostring(obj))
				return tostring(obj);
		else
			    return tostring(obj);
		end
	end
	
	table.insert(ostream, _tostring(maxLevel, argv))
	return table.concat(ostream, "; ");
	
	
end

--打印的函数
function dump_table(table1)
	--if true then return end
	tt={}
	table.insert(tt,'{'.."\n")
	for k,v in pairs(table1) do
		table.insert(tt,watch(1000, v)..',\n')
		--watch(1000, v)
    end
	table.insert(tt,"\n"..'}')
	print(table.concat(tt))
	return table.concat(tt);
end



