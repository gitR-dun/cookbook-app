/* global Vue, VueRouter, axios */


var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};



var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};



var NewRecipePage = {
  template: "#new-recipe-page",
  data: function() {
    return {
      ingredients: "",
      prepTime: "",
      directions: "",
      title: "",
      chef: "",
      image: "",
      errors: []
    };
  },
  created: function() {
    console.log('in new recipe');
  },
  methods: {
    addRecipe: function() {
      var params = {
        ingredients: this.ingredients,
        prep_time: this.prepTime,
        directions: this.directions,
        title: this.title,
        chef: this.chef,
        image: this.image
      };
      axios
        .post("/v2/recipes", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};


var EditRecipePage = {
  template: "#edit-recipe-page",
  data: function() {
    return {
      recipe: {},
      errors: []
    };
  },
  methods: {
    editRecipe: function() {
      var params = {
        ingredients: this.recipe.ingredients,
        prep_time: this.recipe.prepTime,
        directions: this.recipe.directions,
        title: this.recipe.title,
        chef: this.recipe.chef,
        image: this.recipe.image
      };
      console.log(params);
      axios
        .patch("/v2/recipes/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  created: function() {
    console.log('running created');
    axios.get('/v2/recipes/' + this.$route.params.id).then(function(response) {
      this.recipe = response.data;
    }.bind(this));
  }
};


var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v2/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ShowRecipePage = {
  template: "#show-recipe-page",
  data: function() {
    return {
      recipe: {}
    };
  },
  created: function() {
    console.log('in show recipe');
    axios.get('/v2/recipes/' + this.$route.params.id).then(function(response) {
      this.recipe = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes:
    [
      { path: "/", component: HomePage },
      { path: "/signup", component: SignupPage },
      { path: "/login", component: LoginPage },
      { path: "/logout", component: LogoutPage },
      { path: "/recipes/:id/edit", component: EditRecipePage },
      { path: "/recipes/new", component: NewRecipePage },
      { path: "/recipes/:id", component: ShowRecipePage }
    ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      recipes: []
    };
  },
  created: function() {
    console.log('in home page');
    axios.get('/v2/recipes').then(function(response) {
      this.recipes = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};


var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
