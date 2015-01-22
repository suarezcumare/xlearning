#Asignaciones
	Asignacion.create([{titulo: 'practica con los select de sql',descripcion:  'Esta practica es para perfeccionar lo relacionado con el manejo de los select en mysql', instrucciones:' Seguir los pasos de la guia, y si no entiende algo repita el proceso hasta lograrlo', puntuacion: '10'},
		{titulo: 'Realizar unas vistas de registrar paises, y registrar usuario',descripcion:  'Esto permitira el manejo inicial de la vista en el MVC', instrucciones:' Iniciar primero con el registro de paises, para luego inciar con el de registro de usuarios', puntuacion: '12'},
		{titulo: 'Hacer una vista que muestre un banner y un menu en ruby on rails',descripcion:  ' Esto permitira el manejo facil de html', instrucciones:'seguir con la guia de ruby on rails', puntuacion: '15'},
		{titulo: 'Resolver 20 integrales',descripcion:  'Para ampliar la logica matematica', instrucciones:'Seguir los pasos dados en clases', puntuacion: '10'}])
#Asignacion_grupo.create([{fecha_habilitacion: '15.02.28 05:50:50', fecha_cierre:'15.03.12 06:50:50'}])
Curso.create!([
	{nombre: 'Programacion .NET', descripcion: '.NET es un framework de Microsoft que hace un énfasis en la transparencia de redes, con independencia de plataforma de hardware y que permita un rápido desarrollo de aplicaciones.', objetivos: 'Buscar Respuestas al mercado de los negocios en entornos WEB, como competencia a la plataforma Java', prerequisitos: 'Nociones basicas de sql', perfil_estudiante: 'Desarrollar aplicaciones de una manera robusta y segura, rapida y economica', pago: true, costo: 2000.0, matricula_maxima: 100, puntaje_aprobacion: 90.0, horas_semanales: 7, estatus: true},{nombre: 'Desarrollo Orientado a Objetos', descripcion: 'El modelo vista controlador es uno de los mas implementados para el desarrollo orientado a objetos', objetivos: 'Mejorar la calidad del software brindando mayor rapidez al manejo de la base de datos', prerequisitos: 'Nociones basicas para el MVC', perfil_estudiante: 'Desarrollar programas seguros', pago: true, costo: 1000.0, matricula_maxima: 70, puntaje_aprobacion: 80.0, horas_semanales: 5, estatus: true},
 {nombre: 'Desarrollo web con Ruby', descripcion: 'El desarrollo web es de real importancia para lo que es la administracion de online de entidades bancarias,entidades de comunicacion, entre otros', objetivos: 'Brindar servicios web ', prerequisitos: 'Desarrollar programas seguros al alcance de nuestros clientes', perfil_estudiante: 'Brindar seguridad', pago: true, costo: 1300.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: 'Logica de la matematica', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: "Logica de la fisica", descripcion: "Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ", objetivos: "Manejar ciertos calculos como las integrales", prerequisitos: "Tener cierta logica para la matematica", perfil_estudiante: "Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso", pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},
{nombre: 'Logica de la quimica', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: 'Interpretacion de lenguajes', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},
{nombre: 'C#', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: "Visual Basic", descripcion: "Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ", objetivos: "Manejar ciertos calculos como las integrales", prerequisitos: "Tener cierta logica para la matematica", perfil_estudiante: "Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso", pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},
{nombre: 'Comandos basicos en consola', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true}
])

#Categoria
 Categoria.create!([{nombre:'Interfaz de usuario', descripcion: 'PAra las necesidad de los usuarios en mejorar la interfaz'},
 	{nombre:'servicios', descripcion: 'Aquellos servicios para mejorar la calidad del trabajo'},
 	{nombre:'Desarrollo Web', descripcion: 'PAra Agilizar el proceso de creacion y diseño de paginas web'}])
 
 #Curso_Categoria
CursoCategoria.create!([{categoria_id:'3',curso_id:'3'},{categoria_id:'3',curso_id:'2'},{categoria_id:'1',curso_id:'1'},{categoria_id:'2',curso_id:'9'},
	{categoria_id:'2',curso_id:'10'},{categoria_id:'2',curso_id:'8'}])

 #Contenido
Contenido.create!([{orden:'1'},{orden:'2'},{orden:'3'},{orden:'4'},
	{orden:'5'},{orden:'6'}])

#critica_cursos
CriticaCurso.create!([{contenido: 'Buen curso', puntuacion: 10},{contenido:'mal curso', puntuacion: 5}])


#dispositivo
	Dispositivo.create([{nombre: 'desktop'},{nombre: 'movil'},{nombre: 'google glass'},{nombre: 'google wear'}])
	
#licencias
	Licencia.create([{nombre: 'Atribución', descripcion: 'Esta licencia permite a otros distribuir, remezclar, retocar, y crear a partir de tu obra, incluso con fines comerciales, siempre y cuando te den crédito por la creación original. Esta es la más flexible de las licencias ofrecidas. Se recomienda para la máxima difusión y utilización de los materiales licenciados.'},	{nombre: 'Atribución-CompartirIgual', descripcion: 'Esta licencia permite a otros remezclar, retocar, y crear a partir de tu obra, incluso con fines comerciales, siempre y cuando te den crédito y licencien sus nuevas creaciones bajo las mismas condiciones. Esta licencia suele ser comparada con las licencias "copyleft" de software libre y de código abierto. Todas las nuevas obras basadas en la tuya portarán la misma licencia, así que cualesquiera obras derivadas permitirán también uso comercial. Esa es la licencia que usa Wikipedia, y se recomienda para materiales que se beneficiarían de incorporar contenido de Wikipedia y∂ proyectos con licencias similares.'},
		{nombre: 'Atribución-SinDerivadas ', descripcion: 'Esta licencia permite la redistribución, comercial o no comercial, siempre y cuando la obra circule íntegra y sin cambios, dándote crédito.'},
		{nombre: 'Atribución-NoComercial', descripcion: 'Esta licencia permite a otros distribuir, remezclar, retocar, y crear a partir de tu obra de manera no comercial y, a pesar de que sus nuevas obras deben siempre mencionarte y mantenerse sin fines comerciales, no están obligados a licenciar sus∂ obras derivadas bajo las mismas condiciones.'},
		{nombre: 'Atribución-NoComercial-CompartirIgual', descripcion: 'Esta licencia permite a otros distribuir, remezclar, retocar, y crear a partir de tu obra de modo no comercial, siempre y cuando te den crédito y licencien sus nuevas creaciones bajo las mismas condiciones.'},
		{nombre: 'Atribución-NoComercial-SinDerivadas', descripcion: 'Esta licencia es la más restrictiva de nuestras seis licencias principales, permitiendo a otros solo descargar tu obra y compartirla con otros siempre y cuando te den crédito, pero no permiten cambiarlas de forma alguna ni usarlas comercialmente.'}])

#pais
	Pais.create!([{nombre: "Argentina"},{nombre: "Brasil"},{nombre: "Chile"},{nombre: "Colombia"},{nombre: "Costa Rica"},{nombre: 'Cuba'},
		{nombre: 'Dominicana'},{nombre: 'España'},{nombre: 'Estados Unidos'},{nombre: 'Guatemala'},{nombre: 'Honduras'},
		{nombre: 'Mexio'},{nombre: 'Panama'},{nombre: 'Paraguay'},{nombre: 'Peru'},{nombre: 'Puerto Rico'},{nombre: 'Uruguay'},
		{nombre: 'Venezuela'}])

#Rol
	Rol.create!([{nombre: 'Super Administrador'},{nombre: 'Ejecutivo Portal'},{nombre: 'Ejecutivo'},{nombre: 'Administrador'},{nombre: 'Coordinador'},{nombre: 'Facilitador'}, {nombre: 'Estudiante'}])


#tipos de formatos generales
	TipoFormato.create!([{nombre: 'tar'},{nombre: 'zip'},{nombre: 'txt'},{nombre: 'pdf'},{nombre: 'doc'},
		{nombre: 'docx'}, {nombre: 'xmlx'}, {nombre: 'pptx'}, {nombre: 'jpg'}, {nombre: 'png'}, {nombre: 'jpeg'},{nombre: 'gif'},
		{nombre: 'mp3'},{nombre: 'wma'},{nombre: 'mp4'},{nombre: 'css'},{nombre: 'html'},{nombre: 'js'}])

#Evaluaciones
Evaluacion.create!([{titulo: 'Examen de repaso para evaluar ', descripcion:'Evaluacion corta',duracion:'45', estatus:true, maxintentos:'2',cant_preguntas_cerradas:'5',cant_preguntas_abiertas:'5',valor_preguntas_abiertas:'2',valor_preguntas_cerradas:'2',puntuacion:20, tipo:true},
	{titulo:'Examen para evaluar conocimientos', descripcion:'Evaluacion larga',duracion:'3,5', estatus:true, maxintentos:'1',cant_preguntas_cerradas:'10',cant_preguntas_abiertas:'5',valor_preguntas_abiertas:'2',valor_preguntas_cerradas:'1',puntuacion:20, tipo:true},
{titulo: 'Examen largo', descripcion:'evaluacion corta',duracion:'55', estatus:true, maxintentos:'1',cant_preguntas_cerradas:'15',cant_preguntas_abiertas:'15',valor_preguntas_abiertas:'1',valor_preguntas_cerradas:'1',puntuacion:30, tipo:true},	
{titulo: 'Examen Corto', descripcion:'Evaluacion corta',duracion:'30', estatus:true, maxintentos:'4',cant_preguntas_cerradas:'10',cant_preguntas_abiertas:'5',valor_preguntas_abiertas:'1',valor_preguntas_cerradas:'1',puntuacion:15, tipo:true},])

#Evaluacion_grupos
EvaluacionGrupo.create!([{puntuacion: '15/01/17', fecha_cierre: '15/01/18'},{fecha_habilitacion: '15/02/02', fecha_cierre: '15/02/05'},
	{fecha_habilitacion: '15/02/15', fecha_cierre: '15/02/20'},{fecha_habilitacion: '15/03/10', fecha_cierre: '15/03/15'}])

#Evaluacion Presentada
EvaluacionPresentada.create!([{puntuacion: 8, fecha_presentacion: '15/01/18', feedback:'feedback'},{puntuacion: 10, fecha_presentacion: '15/02/05', feedback:'feedback'},
	{puntuacion: 8, fecha_presentacion: '15/02/15', feedback:'feedback'},{puntuacion: 15, fecha_presentacion: '15/03/15', feedback:'feedback'}])

#Grupos 
Grupo.create!([{ fecha_inicio: '15/01/18', fecha_fin:'15/02/18', cierre_inscripcion:'15/01/12',estatus:true},{ fecha_inicio: '15/02/18', fecha_fin:'15/03/18', cierre_inscripcion:'15/02/12',estatus:true},
	{ fecha_inicio: '15/03/18', fecha_fin:'15/04/18', cierre_inscripcion:'15/03/12',estatus:true},{ fecha_inicio: '15/04/18', fecha_fin:'15/05/18', cierre_inscripcion:'15/04/12',estatus:true}])

#historiales
Historial.create!([{ nota: 50, aprobado:true},{ nota: 45, aprobado:false},
	{nota: 90, aprobado:true},{ nota: 38, aprobado:false}])

#item_resumenCC
ItemResumen.create!([{ titulo: 'Resumen del curso', descripcion:'Descripcion del curso'},{titulo: 'Resumen del curso', descripcion:'Descripcion del curso'}])

#Modos de pago
ModoPago.create!([{ nombre: 'Credito', descripcion:'Con tarjetas visa o mastercad'},{titulo: 'Paypal', descripcion:'En divisas'}])

##Asignaciones
	Asignacion.create([{titulo: 'practica con los select de sql',descripcion:  'Esta practica es para perfeccionar lo relacionado con el manejo de los select en mysql', instrucciones:' Seguir los pasos de la guia, y si no entiende algo repita el proceso hasta lograrlo', puntuacion: '10'},
		{titulo: 'Realizar unas vistas de registrar paises, y registrar usuario',descripcion:  'Esto permitira el manejo inicial de la vista en el MVC', instrucciones:' Iniciar primero con el registro de paises, para luego inciar con el de registro de usuarios', puntuacion: '12'},
		{titulo: 'Hacer una vista que muestre un banner y un menu en ruby on rails',descripcion:  ' Esto permitira el manejo facil de html', instrucciones:'seguir con la guia de ruby on rails', puntuacion: '15'},
		{titulo: 'Resolver 20 integrales',descripcion:  'Para ampliar la logica matematica', instrucciones:'Seguir los pasos dados en clases', puntuacion: '10'}])
#Asignacion_grupo.create([{fecha_habilitacion: '15.02.28 05:50:50', fecha_cierre:'15.03.12 06:50:50'}])
Curso.create!([
	{nombre: 'Programacion .NET', descripcion: '.NET es un framework de Microsoft que hace un énfasis en la transparencia de redes, con independencia de plataforma de hardware y que permita un rápido desarrollo de aplicaciones.', objetivos: 'Buscar Respuestas al mercado de los negocios en entornos WEB, como competencia a la plataforma Java', prerequisitos: 'Nociones basicas de sql', perfil_estudiante: 'Desarrollar aplicaciones de una manera robusta y segura, rapida y economica', pago: true, costo: 2000.0, matricula_maxima: 100, puntaje_aprobacion: 90.0, horas_semanales: 7, estatus: true},{nombre: 'Desarrollo Orientado a Objetos', descripcion: 'El modelo vista controlador es uno de los mas implementados para el desarrollo orientado a objetos', objetivos: 'Mejorar la calidad del software brindando mayor rapidez al manejo de la base de datos', prerequisitos: 'Nociones basicas para el MVC', perfil_estudiante: 'Desarrollar programas seguros', pago: true, costo: 1000.0, matricula_maxima: 70, puntaje_aprobacion: 80.0, horas_semanales: 5, estatus: true},
 {nombre: 'Desarrollo web con Ruby', descripcion: 'El desarrollo web es de real importancia para lo que es la administracion de online de entidades bancarias,entidades de comunicacion, entre otros', objetivos: 'Brindar servicios web ', prerequisitos: 'Desarrollar programas seguros al alcance de nuestros clientes', perfil_estudiante: 'Brindar seguridad', pago: true, costo: 1300.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: 'Logica de la matematica', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: "Logica de la fisica", descripcion: "Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ", objetivos: "Manejar ciertos calculos como las integrales", prerequisitos: "Tener cierta logica para la matematica", perfil_estudiante: "Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso", pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},
{nombre: 'Logica de la quimica', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: 'Interpretacion de lenguajes', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},
{nombre: 'C#', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: "Visual Basic", descripcion: "Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ", objetivos: "Manejar ciertos calculos como las integrales", prerequisitos: "Tener cierta logica para la matematica", perfil_estudiante: "Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso", pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},
{nombre: 'Comandos basicos en consola', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true}
])

#Categoria
 Categoria.create!([{nombre:'Interfaz de usuario', descripcion: 'PAra las necesidad de los usuarios en mejorar la interfaz'},
 	{nombre:'servicios', descripcion: 'Aquellos servicios para mejorar la calidad del trabajo'},
 	{nombre:'Desarrollo Web', descripcion: 'PAra Agilizar el proceso de creacion y diseño de paginas web'}])
 
 #Curso_Categoria
CursoCategoria.create!([{categoria_id:'3',curso_id:'3'},{categoria_id:'3',curso_id:'2'},{categoria_id:'1',curso_id:'1'},{categoria_id:'2',curso_id:'9'},
	{categoria_id:'2',curso_id:'10'},{categoria_id:'2',curso_id:'8'}])

 #Contenido
Contenido.create!([{orden:'1'},{orden:'2'},{orden:'3'},{orden:'4'},
	{orden:'5'},{orden:'6'}])

#critica_cursos
CriticaCurso.create!([{contenido: 'Buen curso', puntuacion: 10},{contenido:'mal curso', puntuacion: 5}])


#dispositivo
	Dispositivo.create([{nombre: 'desktop'},{nombre: 'movil'},{nombre: 'google glass'},{nombre: 'google wear'}])
	
#licencias
	Licencia.create([{nombre: 'Atribución', descripcion: 'Esta licencia permite a otros distribuir, remezclar, retocar, y crear a partir de tu obra, incluso con fines comerciales, siempre y cuando te den crédito por la creación original. Esta es la más flexible de las licencias ofrecidas. Se recomienda para la máxima difusión y utilización de los materiales licenciados.'},	{nombre: 'Atribución-CompartirIgual', descripcion: 'Esta licencia permite a otros remezclar, retocar, y crear a partir de tu obra, incluso con fines comerciales, siempre y cuando te den crédito y licencien sus nuevas creaciones bajo las mismas condiciones. Esta licencia suele ser comparada con las licencias "copyleft" de software libre y de código abierto. Todas las nuevas obras basadas en la tuya portarán la misma licencia, así que cualesquiera obras derivadas permitirán también uso comercial. Esa es la licencia que usa Wikipedia, y se recomienda para materiales que se beneficiarían de incorporar contenido de Wikipedia y∂ proyectos con licencias similares.'},
		{nombre: 'Atribución-SinDerivadas ', descripcion: 'Esta licencia permite la redistribución, comercial o no comercial, siempre y cuando la obra circule íntegra y sin cambios, dándote crédito.'},
		{nombre: 'Atribución-NoComercial', descripcion: 'Esta licencia permite a otros distribuir, remezclar, retocar, y crear a partir de tu obra de manera no comercial y, a pesar de que sus nuevas obras deben siempre mencionarte y mantenerse sin fines comerciales, no están obligados a licenciar sus∂ obras derivadas bajo las mismas condiciones.'},
		{nombre: 'Atribución-NoComercial-CompartirIgual', descripcion: 'Esta licencia permite a otros distribuir, remezclar, retocar, y crear a partir de tu obra de modo no comercial, siempre y cuando te den crédito y licencien sus nuevas creaciones bajo las mismas condiciones.'},
		{nombre: 'Atribución-NoComercial-SinDerivadas', descripcion: 'Esta licencia es la más restrictiva de nuestras seis licencias principales, permitiendo a otros solo descargar tu obra y compartirla con otros siempre y cuando te den crédito, pero no permiten cambiarlas de forma alguna ni usarlas comercialmente.'}])

#pais
	Pais.create!([{nombre: "Argentina"},{nombre: "Brasil"},{nombre: "Chile"},{nombre: "Colombia"},{nombre: "Costa Rica"},{nombre: 'Cuba'},
		{nombre: 'Dominicana'},{nombre: 'España'},{nombre: 'Estados Unidos'},{nombre: 'Guatemala'},{nombre: 'Honduras'},
		{nombre: 'Mexio'},{nombre: 'Panama'},{nombre: 'Paraguay'},{nombre: 'Peru'},{nombre: 'Puerto Rico'},{nombre: 'Uruguay'},
		{nombre: 'Venezuela'}])

#Rol
	Rol.create!([{nombre: 'Super Administrador'},{nombre: 'Ejecutivo Portal'},{nombre: 'Ejecutivo'},{nombre: 'Administrador'},{nombre: 'Coordinador'},{nombre: 'Facilitador'}, {nombre: 'Estudiante'}])


#tipos de formatos generales
	TipoFormato.create!([{nombre: 'tar'},{nombre: 'zip'},{nombre: 'txt'},{nombre: 'pdf'},{nombre: 'doc'},
		{nombre: 'docx'}, {nombre: 'xmlx'}, {nombre: 'pptx'}, {nombre: 'jpg'}, {nombre: 'png'}, {nombre: 'jpeg'},{nombre: 'gif'},
		{nombre: 'mp3'},{nombre: 'wma'},{nombre: 'mp4'},{nombre: 'css'},{nombre: 'html'},{nombre: 'js'}])

#Evaluaciones
Evaluacion.create!([{titulo: 'Examen de repaso para evaluar ', descripcion:'Evaluacion corta',duracion:'45', estatus:true, maxintentos:'2',cant_preguntas_cerradas:'5',cant_preguntas_abiertas:'5',valor_preguntas_abiertas:'2',valor_preguntas_cerradas:'2',puntuacion:20, tipo:true},
	{titulo:'Examen para evaluar conocimientos', descripcion:'Evaluacion larga',duracion:'3,5', estatus:true, maxintentos:'1',cant_preguntas_cerradas:'10',cant_preguntas_abiertas:'5',valor_preguntas_abiertas:'2',valor_preguntas_cerradas:'1',puntuacion:20, tipo:true},
{titulo: 'Examen largo', descripcion:'evaluacion corta',duracion:'55', estatus:true, maxintentos:'1',cant_preguntas_cerradas:'15',cant_preguntas_abiertas:'15',valor_preguntas_abiertas:'1',valor_preguntas_cerradas:'1',puntuacion:30, tipo:true},	
{titulo: 'Examen Corto', descripcion:'Evaluacion corta',duracion:'30', estatus:true, maxintentos:'4',cant_preguntas_cerradas:'10',cant_preguntas_abiertas:'5',valor_preguntas_abiertas:'1',valor_preguntas_cerradas:'1',puntuacion:15, tipo:true},])

#Evaluacion_grupos
EvaluacionGrupo.create!([{puntuacion: '15/01/17', fecha_cierre: '15/01/18'},{fecha_habilitacion: '15/02/02', fecha_cierre: '15/02/05'},
	{fecha_habilitacion: '15/02/15', fecha_cierre: '15/02/20'},{fecha_habilitacion: '15/03/10', fecha_cierre: '15/03/15'}])

#Evaluacion Presentada
EvaluacionPresentada.create!([{puntuacion: 8, fecha_presentacion: '15/01/18', feedback:'feedback'},{puntuacion: 10, fecha_presentacion: '15/02/05', feedback:'feedback'},
	{puntuacion: 8, fecha_presentacion: '15/02/15', feedback:'feedback'},{puntuacion: 15, fecha_presentacion: '15/03/15', feedback:'feedback'}])

#Grupos 
Grupo.create!([{ fecha_inicio: '2015-01-18', fecha_fin:'2015-02-18', cierre_inscripcion:'2015-01-12',estatus:true}])

#historiales
Historial.create!([{ nota: 50, aprobado:true},{ nota: 45, aprobado:false},
	{nota: 90, aprobado:true},{ nota: 38, aprobado:false}])

#item_resumenCC
ItemResumen.create!([{ titulo: 'Resumen del curso', descripcion:'Descripcion del curso'},{titulo: 'Resumen del curso', descripcion:'Descripcion del curso'}])

#Modos de pago
ModoPago.create!([{ nombre: 'Credito', descripcion:'Con tarjetas visa o mastercad'},{titulo: 'Paypal', descripcion:'En divisas'}])

#