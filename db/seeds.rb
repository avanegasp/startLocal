Level.create(name: "Teclado Blanco", required_points: 0, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelBlanco%402x.png")
Level.create(name: "Teclado Amarillo", required_points: 1000, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelAmarillo%402x.png")
Level.create(name: "Teclado Naranja", required_points: 2500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelNaranja%402x.png")
Level.create(name: "Teclado Verde", required_points: 4500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelVerde%402x.png")
Level.create(name: "Teclado Azul", required_points: 7500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelAzul%402x.png")
Level.create(name: "Teclado Purpura", required_points: 10500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelPurpura%402x.png")
Level.create(name: "Teclado Café", required_points: 13500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelCafe%402x.png")
Level.create(name: "Teclado Rojo", required_points: 16500, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelRojo%402x.png")
Level.create(name: "Teclado Negro", required_points: 20000, image_url: "https://s3.amazonaws.com/makeitreal/levels/nivelNegro%402x.png")

intro = Subject.create(name: "Una nueva mentalidad", slug: "una-nueva-mentalidad", time_estimate: "2 horas", row_position: 1, published: true,
  description: "Para poder aprender cualquier habilidad, primero debemos cambiar nuestra mentalidad. La barrera no es intelectual, es emocional.",
  excerpt: "Aprender a programar es difícil. Difícil como aprender un nuevo idioma o un instrumento. Se requiere práctica y paciencia.")

html = Subject.create(name: "HTML y CSS", slug: "html-css", time_estimate: "40 horas", row_position: 2, published: true,
  description: "Aprende el lenguaje de marcado que define la estructura de las páginas Web, y el lenguaje de estilos que les da formato.",
  excerpt: "**HTML** es un lenguaje que nos permite definir **la estructura** de las páginas Web. **CSS** es un lenguaje que nos permite definir **el formato (los estilos)** de los elementos HTML.")

ruby = Subject.create(name: "Ruby básico", slug: "ruby-basico", time_estimate: "58 horas", row_position: 3, published: true,
  description: "Aprende las bases de este lenguaje de programación que es usado para crear aplicaciones Web como Twitter, Groupon, o Make it Real Start.",
  excerpt: "Ruby es un lenguaje de programación flexible y expresivo, ideal para principiantes que quieren aprender a programar.")

Resource.create(subject: html, title: "General Assembly - Dash", time_estimate: "4 horas", url: "https://dash.generalassemb.ly/", row_position: 1, published: true,
  description: "Abre una cuenta y crea un landing page usando HTML y CSS. Completa los proyectos: 1. Build a Personal Website y 2. Build a Responsive Blog Theme)")

Resource.create(subject: html, title: "W3Schools - HTML", time_estimate: "2 horas", url: "http://www.w3schools.com/html/html_intro.asp", row_position: 2, published: true,
  description: "Un recurso puntual y claro. A veces un poco difícil de navegar por la publicidad. Ha sido criticado porque, a pesar de su nombre, no tiene afiliación con la W3C (la entidad encargada de definir los estándares de la Web).")

Resource.create(subject: html, title: "W3Schools - CSS", time_estimate: "2 horas", url: "http://www.w3schools.com/css/css_intro.asp", row_position: 3, published: true,
  description: "Un recurso puntual y claro. A veces un poco difícil de navegar por la publicidad. Ha sido criticado porque, a pesar de su nombre, no tiene afiliación con la W3C (la entidad encargada de definir los estándares de la Web).")

Resource.create(subject: html, title: "Codecademy - HTML & CSS", time_estimate: "7 horas", url: "http://www.codecademy.com/tracks/web", row_position: 4, published: true,
  description: "Refuerza tus conocimientos de HTML y CSS con este tutorial interactivo.")

c1 = Challenge.create(subject: html, name: "Hola Mundo", row_position: 1, published: true,
  instructions: "Estas son las instrucciones del challenge.", evaluation: "def evaluate(files); end")
Document.create(folder: c1, name: "index.html", content: "")

c2 = Challenge.create(subject: html, name: "Ordenando el desorden", row_position: 1, published: false,
  instructions: "Estas son las instrucciones del challenge.", evaluation: "def evaluate(files); return 'Siempre mal'; end")
Document.create(folder: c2, name: "index.html", content: "")

User.create(email: "german.escobar@makeitreal.camp", account_type: User.account_types[:admin_account])

User.create(email: "user_free@makeitreal.camp",account_type: User.account_types[:free_account])



Path.create(name: "Full-Stack", description: "Conviértete en un desarrollador Full-Stack.", published: true)
phase = Phase.create(name: "Programador Aprendiz", description: "Aprende los conceptos básicos del desarrollo web.", slug: "programador-aprendiz", published: true, color: "#3590BE", path_id: 1)
CoursePhase.create(phase: phase, subject: intro)
CoursePhase.create(phase: phase, subject: html)
CoursePhase.create(phase: phase, subject: ruby)
