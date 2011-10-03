# ModifyHTML.rb
# Kate Park 9/30/11

# define class ModifyHTML
class ModifyHTML
	# --- INITIALIZE ---
	def initialize
		#puts "INITIALIZE"
	end
	
	# --- removeTable() FUNCTION ---
	# removes the first instance of everything between and including "<table" and "</table"
	def removeTable(array,openTag,closeTag)
		arrayLength = array.length
		locOpen = Array.new
		locClose = Array.new
		countOpen = 0
		countClose = 0
	
		# loops through the array to find the location of the first <table id="toc" tag
		# and the first </table> tag and saves the location to locStart and locEnd
		for i in 0..arrayLength-1
			if (array[i].include? openTag)
				locOpen[countOpen] = i
				countOpen = countOpen + 1
			elsif (array[i].include? closeTag)
				locClose[countClose] = i
				countClose = countClose + 1
			end
		end

		tableLoc = locOpen[0]
	
		while (tableLoc <= locClose[0])
			array.delete_at(locOpen[0])
			tableLoc = tableLoc + 1
		end
	
		return array
	end
	
	# --- searchLink() FUNCTION ---
	# loops through arrHTML[] and finds the location where the string stored in the variable link and '<a href=' exist
	# if both are found, then the line number is saved into then locAnchor[] array
	def searchLink(array,link)
		arrayLength = array.length
		locAnchor = Array.new
		countLoc = 0
			
		for k in 0..arrayLength-1
			if ((array[k].include? "#{link}") && (array[k].include? "<a href="))
				#puts "FOUND #{link} at #{k}!"
				locAnchor[countLoc] = k
				countLoc = countLoc + 1
			end
		end
		
		return locAnchor
	end
end 