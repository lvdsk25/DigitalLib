<%
String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
        	response.sendRedirect("add.jsp");
        }
		else{
			%><html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Premium</title>
<style>
body{
background-image: url(a.c69341b7c2a85ad036d4);
  background-size: cover !important;
  position:relative;
  
}
/* Used to be embedded in the SVG */
.star {
	animation: spin .5s infinite linear;
	transform-origin: center;
}
@keyframes spin {
	from {transform: rotate(0)}
	to   {transform: rotate(30deg)}
}
/* End */

a:hover .star {
	opacity: .4;
}

.no1 {transform-origin: center;}

a:hover .no1 {
	fill: olive;
	transform: scale(1.2);
}
svg {
	height: 500px;
	width: 500px;
}
    svg * {transition: all .5s;}

text {
	fill: red;
	font-family: 'Fontdiner Swanky', 'Cooper Black';
  font-size: 15px;
	opacity: .4;
	text-shadow: .4em .4em .2em rgba(0,0,0,1);
}
a:hover .cheap {
	paint-order: stroke fill;
	stroke: maroon;
	stroke-dasharray: 4,1;
	stroke-width: .4em;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
<p>
		<a href="#">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 109.451 109.451">
        <script>
		    console.log("Bonk!");
	      </script>
				<path class="star" d="M61.933 93.587L50.425 109.45l-8.89-17.467-17.898 7.985 1.036-19.57-19.493-2.034 10.683-16.43L0 50.426l17.467-8.89-7.985-17.898 19.57 1.036 2.034-19.493 16.43 10.683L59.025 0l8.889 17.467 17.898-7.985-1.036 19.57 19.493 2.034-10.683 16.43 15.864 11.508-17.467 8.889 7.985 17.898-19.57-1.036-2.034 19.493z" fill="#faa"/>
				<path class="no1" d="M59.613 63.557q.347 0 1.637.174.595.099.943.099 2.108 0 2.43-3.324.174-1.885.174-10.716 0-1.34-.546-1.86-.546-.52-1.984-.52-.347 0-.992.074-.496.05-.868.05-.843 0-1.364-.446-.52-.47-.52-1.215 0-.794.794-1.563.794-.794 2.208-1.39 7.02-2.976 14.932-2.976 2.158 0 3.125.52.992.496.992 1.612 0 .645-.322 1.017-.322.347-1.3.769-1.538.67-1.76 1.637-.223.967-.347 7.54.198 6.648.223 7.119.025.47.198 1.315.298 1.315 1.116 1.81.819.496 2.877.595 2.332.099 2.332 1.9 0 1.885-3.3 2.48-4.59.819-9.426.819-3.175 0-6.003-.372-3.547-.496-5.507-1.215-1.9-.694-1.9-2.084 0-.744.62-1.3.62-.546 1.538-.57zm-28.054-1.09l.174-1.09q.099-.943.099-.967 0-.794-1.24-.794-.298 0-1.836.124-.298.025-.546.025-1.042 0-1.042-.77 0-.322.744-1.76.744-1.464 1.24-2.108.769-1.017 1.836-1.017.298 0 .67.05.273.025.47.025.595 0 .744-.943l.174-1.414q.025-.174.025-.347-.025-.67-.77-.67-.397 0-2.332.124-.372.025-.546.025-1.042 0-1.042-.77 0-.347.719-1.736.719-1.414 1.265-2.133.769-1.017 1.86-1.017.298 0 .67.05.298.05.47.05.595 0 .719-.967l.149-.943q.149-1.19.174-3.423.025-1.116.695-1.588.719-.47 2.356-1.067 1.662-.595 2.332-.595.843 0 .843.744 0 .273-.15.868-.124.422-.397 2.356l-.496 3.62q-.074.47-.074.52-.05.645 1.09.645h1.29q.744 0 .992-.198.248-.223.347-.967l.124-.918q.198-1.364.198-3.373 0-1.14.695-1.637.719-.496 2.356-1.067 1.662-.595 2.356-.595.322 0 .57.223.248.223.248.52 0 .273-.174.868-.1.422-.372 2.356l-.496 3.62q-.074.446-.074.595 0 .57.868.57 1.786 0 2.282-.05.52-.074.695-.074.794 0 .794.819 0 .496-1.24 2.902-1.017 1.935-2.133 1.935-.397 0-1.09-.124-.322-.05-.47-.05-.57 0-.695.943l-.15 1.166q-.074.47-.074.62 0 .769 1.389.769.967 0 1.76-.1.446-.074.67-.074.819 0 .819.719 0 .447-.62 1.786-.62 1.339-1.19 2.133-.744 1.017-1.538 1.017-.496 0-1.116-.124-.322-.05-.47-.05-.57 0-.695.893-.372 2.307-.422 4.614-.05 1.414-.744 1.96-.57.47-2.38 1.166-1.786.695-2.356.695-.794 0-.794-.893 0-.223.124-.794.422-2.108.819-4.91l.198-1.44q.05-.298.05-.546 0-.868-1.042-.868h-1.463q-1.042 0-1.14 1.017l-.074.546q-.298 2.084-.347 4.068-.05 1.414-.744 1.96-.57.47-2.38 1.166-1.786.695-2.356.695-.794 0-.794-.918 0-.198.124-.77.422-2.133.819-4.91zm7.64-8.086h1.637q.645 0 .843-.174.223-.174.322-.843l.174-1.39q.074-.447.074-.57 0-.595-.918-.595h-1.637q-.645 0-.868.174-.198.174-.273.843l-.198 1.389q-.05.298-.05.546 0 .62.893.62z" fill="maroon"/>
				<text x="15" y="30" class="cheap">Very cheap</text>
			</svg>
		</a>
	</p>
</div>
<div class="col-md-6">
	<div class="c" style="margin-top: 80px;width:500px;height:500px;">
		<marquee direction="up"><p style="color: tomato;margin-top: -200px;height: 500px;font-size:20px;">
			

Digital libraries: the need for a generic conceptual framework
Digital libraries are extremely complex information systems. Different historical and technological views, along with varied perspectives (from LIS, information retrieval, or human–computer interaction communities) have created differing definitions. Levy and Marshall felt that digital libraries are a polygamy of documents, technology, and work.11 Lesk analyzed the relative importance of the words digital and library and concluded that many of those efforts were not associated with users’ needs and the use of provided resources.12

The President’s Information Technology Advisory Committee Panel on Digital Libraries discusses “digital libraries – the networked collections of digital text, documents, images, sounds, scientific data, and software that are the core of today’s Internet and tomorrow’s universally accessible digital repositories of all human knowledge. Underlying all of these is the consensus agreement that digital libraries are fundamentally complex. Such complexity is due to the inherently interdisciplinary nature of this kind of system. Digital libraries integrate findings from disciplines such as hypertext, information retrieval, multimedia services, database management, and human–computer interaction. The need to put all these together complicates the understanding of the underlying concepts and functionalities of digital libraries, thus making it difficult to construct new digital library systems.”13

The unique requirements of digital libraries need new frameworks and theories, these can help to understand better the complex interactions among its various elements.14 The Joint NSF-European Union Working Groups on Future Directions of Digital Libraries Research supported this claim by recommending that “new frameworks and theories be developed in order to understand the complex interactions between the various components in a globally distributed digital library.”15 Though the necessity for such an underlying theory has long been advocated, little progress has been made towards a formal framework or theory for digital libraries. A formal framework should be able to include both the general characteristics and the common features of a set of systems and explain their structures and processes.
		</p>
	</marquee>
	<h1></h1>
	<a href="payment.jsp"><button class="btn btn-primary" style="width:140px;height:50px;">MAKE PAYMENT</button></a>
	</div>
</div>
</div>
</div>
	</body>
<%
			
		}
%>
