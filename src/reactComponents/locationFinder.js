var React        = require("react");
var LocationForm = require("./locationForm");
var StoreList    = require("./storeList");

var fieldValues = {
  locationQuery: "",
  stores: []
}

var LocationFinder = React.createClass({
  getInitialState: function(){
    return {
      mode: "form"
    }
  },
  saveValues: function(fields){
    return function() {
      fieldValues = Object.assign({}, fieldValues, fields)
    }();
  },
  showStores: function(){
    this.setState({
      mode : "results"
    });
  },
  showForm: function(){
    this.setState({
      mode: "form"
    });
  },
  render: function(){
    switch (this.state.mode) {
      case "form":
        return <LocationForm fieldValues={fieldValues}
                             showStores={this.showStores}
                             saveValues={this.saveValues}
        />;
        break;
      case "results":
        return <StoreList data={fieldValues}
                          showForm={this.showForm}
        />;
        break;
    }
  }
});

module.exports = LocationFinder;
