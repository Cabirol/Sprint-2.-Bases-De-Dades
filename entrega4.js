db.restaurants.find();
db.restaurants.find({}, {restaurant_id:1, name:1, borough:1, cuisine:1});
db.restaurants.find({}, {_id:0, restaurant_id:1, name:1, borough:1, cuisine:1});
db.restaurants.find({}, {_id:0, restaurant_id:1, name:1, borough:1, address:{zipcode:1}});
db.restaurants.find({borough:'Bronx'});
db.restaurants.find({borough:'Bronx'}).limit(5);
db.restaurants.find({borough:'Bronx'}).skip(5).limit(5);
db.restaurants.find({'grades.score': {$gt:90}});
db.restaurants.find({'grades.score': {$gt:80, $lt:100 }});
db.restaurants.find({'address.coord.0': {$lt:-95.754168}});
db.restaurants.find({cuisine:{$ne:'American'}, 'grades.score': {$gt:70}, 'address.coord.0': {$lt:-65.754168}});
db.restaurants.find({cuisine:{$ne:'American'}, 'grades.score': {$gt:70}, 'address.coord.0': {$lt:-65.754168}});
db.restaurants.find({cuisine: {$ne:'American'}, 'grades.grade': 'A', borough: {$ne: 'Brooklyn'}}).sort({cuisine: -1});
db.restaurants.find({name: /^Wil/}, {_id:0, restaurant_id:1, name:1, borough:1, cuisine:1});
db.restaurants.find({name: /ces$/}, {_id:0, restaurant_id:1, name:1, borough:1, cuisine:1});
db.restaurants.find({name: /Reg/}, {_id:0, restaurant_id:1, name:1, borough:1, cuisine:1});
db.restaurants.find({borough: 'Bronx', $or:[{cuisine: 'American'}, {cuisine: 'Chinese'}]});
db.restaurants.find({$or: [{borough: 'Bronx'}, {borough: 'Queens'}, {borough: 'Staten Island'}]}, {_id:0, restaurant_id:1, name:1, borough:1, cuisine:1});
db.restaurants.find({$nor: [{borough: 'Bronx'}, {borough:"Brooklyn"}, {borough: 'Queens'}, {borough: 'Staten Island'}]}, {_id:0, restaurant_id:1,name:1,borough:1,cuisine:1});
db.restaurants.find({'grades.score': {$lte:10}},{restaurant_id:1,name:1,borough:1,cuisine:1,_id:0});
// Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que preparen marisc ('seafood') excepte si son 'American', 'Chinese' o el name del restaurant comença amb lletres 'Wil'
// Escriu una consulta per trobar el restaurant_id, name i grades per a aquells restaurants que aconsegueixin un grade de "A" i un score de 11 amb un ISODate "2014-08-11T00:00:00Z"
// Escriu una consulta per trobar el restaurant_id, name i grades per a aquells restaurants on el 2n element de l'array de graus conté un grade de "A" i un score 9 amb un ISODate "2014-08-11T00:00:00Z"
// Escriu una consulta per trobar el restaurant_id, name, adreça i ubicació geogràfica per a aquells restaurants on el segon element del array coord conté un valor entre 42 i 52
// Escriu una consulta per organitzar el nom dels restaurants en ordre ascendent juntament amb totes les columnes
// Escriu una consulta per organitzar el nom dels restaurants en ordre descendent juntament amb totes les columnes
// Escriu una consulta per organitzar el nom de la cuisine en ordre ascendent i el barri en ordre descendent
// Escriu una consulta per saber si les direccions contenen el carrer
// Escriu una consulta que seleccioni tots el documents en la col·lecció de restaurants on els valors del camp coord és de tipus Double
// Escriu una consulta que seleccioni el restaurant_id, name i grade per a aquells restaurants que retornen 0 com a residu després de dividir algun dels seus score per 7
// Escriu una consulta per trobar el name de restaurant, borough, longitud, latitud i cuisine per a aquells restaurants que contenen 'mon' en algun lloc del seu name
// Escriu una consulta per trobar el name de restaurant, borough, longitud, latitud i cuisine per a aquells restaurants que conteinen 'Mad' com a primeres tres lletres del seu name