var Category = React.createClass({
    getInitialState: function () {
        return {
            name: ""
        };
    },

handleSearch: function() {
  var cname = FUSION.get.node("category_search_box").value;
  if(!FUSION.lib.isBlank(cname) && cname.length > 2) {
    this.setState({category: []});
    return $.ajax({
      method: 'GET',
      beforeSend: function(xhr) {
        xhr.setRequestHeader("X-CSRF=Token", jQuery('meta[name="csrf-token"]').attr('content'));
        xhr.setRequestHeader("Accept", "text/html");
      },
      url: "/categories/1/searchCategoryNames",
      dataType: 'JSON',
      data: {
        category_name: cname
      },
      success: (fuction(_this) {
        return function(data) {
          if(data['status'] == "success") {
            _this.setState(categories: data['content']['categories']});
        }
      };
    })(this)
  });
}
