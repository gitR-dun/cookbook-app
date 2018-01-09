/* global axios */

// grab html element
var recipeContainer = document.querySelector('.row');
// grab the template
var recipeTemplate = document.querySelector('#recipe-card');
// modify it's styling

axios.get("http://localhost:3000/v2/recipes").then(function(response) {
  console.log(response.data);
  var recipes = response.data;
  for (var i = 0; i < recipes.length; i++) {
    // get the copied recipeTemplate
    var recipeClone = recipeTemplate.content.cloneNode(true);
    // modify that thing with information from the db (recipes array)
    recipeClone.querySelector('.title').innerText = recipes[i].title;
    recipeClone.querySelector('.chef').innerText = recipes[i].chef;
    recipeClone.querySelector('.ingredients').innerText = recipes[i].ingredients;
    recipeClone.querySelector('.directions').innerText = recipes[i].directions;
    recipeClone.querySelector('.prep-time').innerText = recipes[i].prep_time;
    recipeClone.querySelector('.image').src = recipes[i].image;
    recipeContainer.appendChild(recipeClone);
  }
});

