// Generated by CoffeeScript 1.7.1
(function() {
  var BaseCollection, CategoryCollection, ItemCollection,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  BaseCollection = (function(_super) {
    __extends(BaseCollection, _super);

    function BaseCollection() {
      return BaseCollection.__super__.constructor.apply(this, arguments);
    }

    return BaseCollection;

  })(Backbone.Collection);

  CategoryCollection = (function(_super) {
    __extends(CategoryCollection, _super);

    function CategoryCollection() {
      return CategoryCollection.__super__.constructor.apply(this, arguments);
    }

    return CategoryCollection;

  })(BaseCollection);

  ItemCollection = (function(_super) {
    __extends(ItemCollection, _super);

    function ItemCollection() {
      return ItemCollection.__super__.constructor.apply(this, arguments);
    }

    return ItemCollection;

  })(BaseCollection);

}).call(this);
