module MenuHelper
	def construir menu
		codigo = "<ul class='nav nav-pills nav-stacked'>"
		menu.opcionmenu.each do |item|
			if item.hijos.length > 0
				codigo << "<li><a href='#submenu-#{item.id}' class='submenu-trigger' data-toggle='collapse'>"
				codigo << "<i class='#{item.icono.to_s}'></i> #{item.nombre}</a>"
				codigo << "<div id='submenu-#{item.id}' class='collapsible collapse'>"
				codigo << "<ul class='submenu'>"
				item.hijos.each do |hijo|
					codigo << "<li><a href='javascript:void(0)'><i class='#{hijo.icono.to_s}'></i> #{hijo.nombre}</a></li>"
				end
				codigo << "</ul></div></li>"
			else
				codigo << "<li><a href='javascript:void(0)'><i class='#{item.icono.to_s}'></i>#{item.nombre}</a></li>"
			end
		end
		codigo << "</ul>"

		raw(codigo)
	end
end