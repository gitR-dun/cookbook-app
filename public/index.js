// grab html element
var recipeContainer = document.querySelector('.row');
// grab the template
var recipeTemplate = document.querySelector('#recipe-card');
// modify it's styling
recipeContainer.appendChild(recipeTemplate.content.cloneNode(true));

