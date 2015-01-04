# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#dispositivo
	Dispositivo.create([{nombre: 'desktop'},{nombre: 'movil'},{nombre: 'google glass'},{nombre: 'google wear'},])
	
#licencias
	Licencia.create([{nombre: 'Atribución', descripcion: 'Esta licencia permite a otros distribuir, remezclar, retocar, y crear a partir de tu obra, incluso con fines comerciales, siempre y cuando te den crédito por la creación original. Esta es la más flexible de las licencias ofrecidas. Se recomienda para la máxima difusión y utilización de los materiales licenciados.'},
		{nombre: 'Atribución-CompartirIgual', descripcion: 'Esta licencia permite a otros remezclar, retocar, y crear a partir de tu obra, incluso con fines comerciales, siempre y cuando te den crédito y licencien sus nuevas creaciones bajo las mismas condiciones. Esta licencia suele ser comparada con las licencias "copyleft" de software libre y de código abierto. Todas las nuevas obras basadas en la tuya portarán la misma licencia, así que cualesquiera obras derivadas permitirán también uso comercial. Esa es la licencia que usa Wikipedia, y se recomienda para materiales que se beneficiarían de incorporar contenido de Wikipedia y∂ proyectos con licencias similares.'},
		{nombre: 'Atribución-SinDerivadas ', descripcion: 'Esta licencia permite la redistribución, comercial o no comercial, siempre y cuando la obra circule íntegra y sin cambios, dándote crédito.'},
		{nombre: 'Atribución-NoComercial', descripcion: 'Esta licencia permite a otros distribuir, remezclar, retocar, y crear a partir de tu obra de manera no comercial y, a pesar de que sus nuevas obras deben siempre mencionarte y mantenerse sin fines comerciales, no están obligados a licenciar sus∂ obras derivadas bajo las mismas condiciones.'},
		{nombre: 'Atribución-NoComercial-CompartirIgual', descripcion: 'Esta licencia permite a otros distribuir, remezclar, retocar, y crear a partir de tu obra de modo no comercial, siempre y cuando te den crédito y licencien sus nuevas creaciones bajo las mismas condiciones.'},
		{nombre: 'Atribución-NoComercial-SinDerivadas', descripcion: 'Esta licencia es la más restrictiva de nuestras seis licencias principales, permitiendo a otros solo descargar tu obra y compartirla con otros siempre y cuando te den crédito, pero no permiten cambiarlas de forma alguna ni usarlas comercialmente.'}])

#pais
	Pais.create([{nombre: 'Argentina'},{nombre: 'Brasil'},{nombre: 'Chile'},{nombre: 'Colombia'},{nombre: 'Costa Rica'},{nombre: 'Cuba'},
		{nombre: 'Dominicana'},{nombre: 'España'}{nombre: 'Estados Unidos'},,{nombre: 'Guatemala'},{nombre: 'Honduras'},
		{nombre: 'Mexio'},{nombre: 'Panama'},{nombre: 'Paraguay'},{nombre: 'Peru'},{nombre: 'Puerto Rico'},{nombre: 'Uruguay'},
		{nombre: 'Venezuela'}])

#Rol
	Rol.create([{nombre: 'Super Administrador'},{nombre: 'Ejecutivo Portal'},{nombre: 'Ejecutivo'},{nombre: 'Administrador'},{nombre: 'Coordinador'},{nombre: 'Facilitador'}, {nombre: 'Estudiante'}])


#tipos de formatos generales
	Tipo_Formato.create([{nombre: 'tar'},{nombre: 'zip'},{nombre: 'txt'},{nombre: 'pdf'},{nombre: 'doc'},
		{nombre: 'docx'}, {nombre: 'xmlx'}, {nombre: 'pptx'}, {nombre: 'jpg'}, {nombre: 'png'}, {nombre: 'jpeg'},{nombre: 'gif'},
		{nombre: 'mp3'},{nombre: 'wma'},{nombre: 'mp4'},{nombre: 'css'},{nombre: 'html'},{nombre: 'js'}])




