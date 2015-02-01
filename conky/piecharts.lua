function conky_piechart(device,fontsize)
	percent=tonumber(conky_parse('${fs_used_perc ' .. device .. '}'))
	if (percent) < 0 then percent="0"
	elseif (percent)>100 then percent="100"
	end
	return string.format("${font Pie charts for maps:size=%i}%s${font}", 
			fontsize, 
			string.char(string.byte("A")+(percent/5)))
end
