require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"ViewNavigationController":[function(require,module,exports){
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

exports.ViewNavigationController = (function(superClass) {
  var ANIMATION_OPTIONS, BACKBUTTON_VIEW_NAME, BACK_BUTTON_FRAME, DEBUG_MODE, DIR, INITIAL_VIEW_NAME, PUSH;

  extend(ViewNavigationController, superClass);

  INITIAL_VIEW_NAME = "initialView";

  BACKBUTTON_VIEW_NAME = "vnc-backButton";

  ANIMATION_OPTIONS = {
    time: 0.3,
    curve: "ease-in-out"
  };

  BACK_BUTTON_FRAME = {
    x: 0,
    y: 40,
    width: 88,
    height: 88
  };

  PUSH = {
    UP: "pushUp",
    DOWN: "pushDown",
    LEFT: "pushLeft",
    RIGHT: "pushRight",
    CENTER: "pushCenter"
  };

  DIR = {
    UP: "up",
    DOWN: "down",
    LEFT: "left",
    RIGHT: "right"
  };

  DEBUG_MODE = false;

  function ViewNavigationController(options) {
    var base, base1, base2, base3;
    this.options = options != null ? options : {};
    this.views = this.history = this.initialView = this.currentView = this.previousView = this.animationOptions = this.initialViewName = null;
    if ((base = this.options).width == null) {
      base.width = Screen.width;
    }
    if ((base1 = this.options).height == null) {
      base1.height = Screen.height;
    }
    if ((base2 = this.options).clip == null) {
      base2.clip = true;
    }
    if ((base3 = this.options).backgroundColor == null) {
      base3.backgroundColor = "#999";
    }
    ViewNavigationController.__super__.constructor.call(this, this.options);
    this.views = [];
    this.history = [];
    this.animationOptions = this.options.animationOptions || ANIMATION_OPTIONS;
    this.initialViewName = this.options.initialViewName || INITIAL_VIEW_NAME;
    this.backButtonFrame = this.options.backButtonFrame || BACK_BUTTON_FRAME;
    this.debugMode = this.options.debugMode != null ? this.options.debugMode : DEBUG_MODE;
    this.on("change:subLayers", function(changeList) {
      var i, len, ref, results, subLayer;
      ref = changeList.added;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        subLayer = ref[i];
        results.push(this.addView(subLayer, true));
      }
      return results;
    });
  }

  ViewNavigationController.prototype.addView = function(view, viaInternalChangeEvent) {
    var obj, vncHeight, vncWidth;
    vncWidth = this.options.width;
    vncHeight = this.options.height;
    view.states.add((
      obj = {},
      obj["" + PUSH.UP] = {
        x: 0,
        y: -vncHeight
      },
      obj["" + PUSH.LEFT] = {
        x: -vncWidth,
        y: 0
      },
      obj["" + PUSH.CENTER] = {
        x: 0,
        y: 0
      },
      obj["" + PUSH.RIGHT] = {
        x: vncWidth,
        y: 0
      },
      obj["" + PUSH.DOWN] = {
        x: 0,
        y: vncHeight
      },
      obj
    ));
    view.states.animationOptions = this.animationOptions;
    if (view.name === this.initialViewName) {
      this.initialView = view;
      this.currentView = view;
      view.states.switchInstant(PUSH.CENTER);
      this.history.push(view);
    } else {
      view.states.switchInstant(PUSH.RIGHT);
    }
    if (!(view.superLayer === this || viaInternalChangeEvent)) {
      view.superLayer = this;
    }
    if (view.name !== this.initialViewName) {
      this._applyBackButton(view);
    }
    return this.views.push(view);
  };

  ViewNavigationController.prototype.transition = function(view, direction, switchInstant, preventHistory) {
    if (direction == null) {
      direction = DIR.RIGHT;
    }
    if (switchInstant == null) {
      switchInstant = false;
    }
    if (preventHistory == null) {
      preventHistory = false;
    }
    if (view === this.currentView) {
      return false;
    }
    if (direction === DIR.RIGHT) {
      view.states.switchInstant(PUSH.RIGHT);
      this.currentView.states["switch"](PUSH.LEFT);
    } else if (direction === DIR.DOWN) {
      view.states.switchInstant(PUSH.DOWN);
      this.currentView.states["switch"](PUSH.UP);
    } else if (direction === DIR.LEFT) {
      view.states.switchInstant(PUSH.LEFT);
      this.currentView.states["switch"](PUSH.RIGHT);
    } else if (direction === DIR.UP) {
      view.states.switchInstant(PUSH.UP);
      this.currentView.states["switch"](PUSH.DOWN);
    } else {
      view.states.switchInstant(PUSH.CENTER);
      this.currentView.states.switchInstant(PUSH.LEFT);
    }
    view.states["switch"](PUSH.CENTER);
    this.previousView = this.currentView;
    this.currentView = view;
    if (preventHistory === false) {
      this.history.push(this.previousView);
    }
    return this.emit(Events.Change);
  };

  ViewNavigationController.prototype.removeBackButton = function(view) {
    return Utils.delay(0, (function(_this) {
      return function() {
        return view.subLayersByName(BACKBUTTON_VIEW_NAME)[0].visible = false;
      };
    })(this));
  };

  ViewNavigationController.prototype.back = function() {
    var direction, preventHistory, switchInstant;
    this.transition(this._getLastHistoryItem(), direction = DIR.LEFT, switchInstant = false, preventHistory = true);
    return this.history.pop();
  };

  ViewNavigationController.prototype._getLastHistoryItem = function() {
    return this.history[this.history.length - 1];
  };

  ViewNavigationController.prototype._applyBackButton = function(view, frame) {
    if (frame == null) {
      frame = this.backButtonFrame;
    }
    return Utils.delay(0, (function(_this) {
      return function() {
        var backButton;
        if (view.backButton !== false) {
          backButton = new Layer({
            name: BACKBUTTON_VIEW_NAME,
            width: 80,
            height: 80,
            superLayer: view
          });
          if (_this.debugMode === false) {
            backButton.backgroundColor = "transparent";
          }
          backButton.frame = frame;
          return backButton.on(Events.Click, function() {
            return _this.back();
          });
        }
      };
    })(this));
  };

  return ViewNavigationController;

})(Layer);


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL21peW91bmd5b29uL0dvb2dsZSDhhIPhhbPhhIXhhaHhhIvhhbXhhIfhhbMvRlJBTUVSX2lNQUMvZnJhbWVyX2dvb2dsZWRyaXZlL2RlbGV0ZS93ZWJfZGFzaGJvYXJkX3N1Yi5mcmFtZXIvbW9kdWxlcy9teU1vZHVsZS5jb2ZmZWUiLCIuLi8uLi8uLi8uLi8uLi9Vc2Vycy9taXlvdW5neW9vbi9Hb29nbGUg4YSD4YWz4YSF4YWh4YSL4YW14YSH4YWzL0ZSQU1FUl9pTUFDL2ZyYW1lcl9nb29nbGVkcml2ZS9kZWxldGUvd2ViX2Rhc2hib2FyZF9zdWIuZnJhbWVyL21vZHVsZXMvVmlld05hdmlnYXRpb25Db250cm9sbGVyLmNvZmZlZSIsIm5vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiXSwic291cmNlc0NvbnRlbnQiOlsiIyBBZGQgdGhlIGZvbGxvd2luZyBsaW5lIHRvIHlvdXIgcHJvamVjdCBpbiBGcmFtZXIgU3R1ZGlvLiBcbiMgbXlNb2R1bGUgPSByZXF1aXJlIFwibXlNb2R1bGVcIlxuIyBSZWZlcmVuY2UgdGhlIGNvbnRlbnRzIGJ5IG5hbWUsIGxpa2UgbXlNb2R1bGUubXlGdW5jdGlvbigpIG9yIG15TW9kdWxlLm15VmFyXG5cbmV4cG9ydHMubXlWYXIgPSBcIm15VmFyaWFibGVcIlxuXG5leHBvcnRzLm15RnVuY3Rpb24gPSAtPlxuXHRwcmludCBcIm15RnVuY3Rpb24gaXMgcnVubmluZ1wiXG5cbmV4cG9ydHMubXlBcnJheSA9IFsxLCAyLCAzXSIsImNsYXNzIGV4cG9ydHMuVmlld05hdmlnYXRpb25Db250cm9sbGVyIGV4dGVuZHMgTGF5ZXJcblxuXHQjIFNldHVwIENsYXNzIENvbnN0YW50c1xuXHRJTklUSUFMX1ZJRVdfTkFNRSA9IFwiaW5pdGlhbFZpZXdcIlxuXHRCQUNLQlVUVE9OX1ZJRVdfTkFNRSA9IFwidm5jLWJhY2tCdXR0b25cIlxuXHRBTklNQVRJT05fT1BUSU9OUyA9IFxuXHRcdHRpbWU6IDAuM1xuXHRcdGN1cnZlOiBcImVhc2UtaW4tb3V0XCJcblx0QkFDS19CVVRUT05fRlJBTUUgPSBcblx0XHR4OiAwXG5cdFx0eTogNDBcblx0XHR3aWR0aDogODhcblx0XHRoZWlnaHQ6IDg4XG5cdFBVU0ggPVxuXHRcdFVQOiAgICAgXCJwdXNoVXBcIlxuXHRcdERPV046ICAgXCJwdXNoRG93blwiXG5cdFx0TEVGVDogICBcInB1c2hMZWZ0XCJcblx0XHRSSUdIVDogIFwicHVzaFJpZ2h0XCJcblx0XHRDRU5URVI6IFwicHVzaENlbnRlclwiXG5cdERJUiA9XG5cdFx0VVA6ICAgIFwidXBcIlxuXHRcdERPV046ICBcImRvd25cIlxuXHRcdExFRlQ6ICBcImxlZnRcIlxuXHRcdFJJR0hUOiBcInJpZ2h0XCJcblx0REVCVUdfTU9ERSA9IGZhbHNlXG5cdFx0XG5cdCMgU2V0dXAgSW5zdGFuY2UgYW5kIEluc3RhbmNlIFZhcmlhYmxlc1x0XG5cdGNvbnN0cnVjdG9yOiAoQG9wdGlvbnM9e30pIC0+XG5cblx0XHRAdmlld3MgPSBAaGlzdG9yeSA9IEBpbml0aWFsVmlldyA9IEBjdXJyZW50VmlldyA9IEBwcmV2aW91c1ZpZXcgPSBAYW5pbWF0aW9uT3B0aW9ucyA9IEBpbml0aWFsVmlld05hbWUgPSBudWxsXG5cdFx0QG9wdGlvbnMud2lkdGggICAgICAgICAgID89IFNjcmVlbi53aWR0aFxuXHRcdEBvcHRpb25zLmhlaWdodCAgICAgICAgICA/PSBTY3JlZW4uaGVpZ2h0XG5cdFx0QG9wdGlvbnMuY2xpcCAgICAgICAgICAgID89IHRydWVcblx0XHRAb3B0aW9ucy5iYWNrZ3JvdW5kQ29sb3IgPz0gXCIjOTk5XCJcblx0XHRcblx0XHRzdXBlciBAb3B0aW9uc1xuXHRcdFxuXHRcdEB2aWV3cyAgID0gW11cblx0XHRAaGlzdG9yeSA9IFtdXG5cdFx0QGFuaW1hdGlvbk9wdGlvbnMgPSBAb3B0aW9ucy5hbmltYXRpb25PcHRpb25zIG9yIEFOSU1BVElPTl9PUFRJT05TXG5cdFx0QGluaXRpYWxWaWV3TmFtZSAgPSBAb3B0aW9ucy5pbml0aWFsVmlld05hbWUgIG9yIElOSVRJQUxfVklFV19OQU1FXG5cdFx0QGJhY2tCdXR0b25GcmFtZSAgPSBAb3B0aW9ucy5iYWNrQnV0dG9uRnJhbWUgIG9yIEJBQ0tfQlVUVE9OX0ZSQU1FXG5cblx0XHRAZGVidWdNb2RlID0gaWYgQG9wdGlvbnMuZGVidWdNb2RlPyB0aGVuIEBvcHRpb25zLmRlYnVnTW9kZSBlbHNlIERFQlVHX01PREVcblx0XHRcblx0XHRALm9uIFwiY2hhbmdlOnN1YkxheWVyc1wiLCAoY2hhbmdlTGlzdCkgLT5cblx0XHRcdEBhZGRWaWV3IHN1YkxheWVyLCB0cnVlIGZvciBzdWJMYXllciBpbiBjaGFuZ2VMaXN0LmFkZGVkXG5cblx0YWRkVmlldzogKHZpZXcsIHZpYUludGVybmFsQ2hhbmdlRXZlbnQpIC0+XG5cdFx0XG5cdFx0dm5jV2lkdGggID0gQG9wdGlvbnMud2lkdGhcblx0XHR2bmNIZWlnaHQgPSBAb3B0aW9ucy5oZWlnaHRcblxuXHRcdHZpZXcuc3RhdGVzLmFkZFxuXHRcdFx0XCIjeyBQVVNILlVQIH1cIjpcblx0XHRcdFx0eDogMFxuXHRcdFx0XHR5OiAtdm5jSGVpZ2h0XG5cdFx0XHRcIiN7IFBVU0guTEVGVCB9XCI6XG5cdFx0XHRcdHg6IC12bmNXaWR0aFxuXHRcdFx0XHR5OiAwXG5cdFx0XHRcIiN7IFBVU0guQ0VOVEVSIH1cIjpcblx0XHRcdFx0eDogMFxuXHRcdFx0XHR5OiAwXG5cdFx0XHRcIiN7IFBVU0guUklHSFQgfVwiOlxuXHRcdFx0XHR4OiB2bmNXaWR0aFxuXHRcdFx0XHR5OiAwXG5cdFx0XHRcIiN7IFBVU0guRE9XTiB9XCI6XG5cdFx0XHRcdHg6IDBcblx0XHRcdFx0eTogdm5jSGVpZ2h0XG5cblx0XHRcdFxuXHRcdHZpZXcuc3RhdGVzLmFuaW1hdGlvbk9wdGlvbnMgPSBAYW5pbWF0aW9uT3B0aW9uc1xuXHRcdFxuXHRcdGlmIHZpZXcubmFtZSBpcyBAaW5pdGlhbFZpZXdOYW1lXG5cdFx0XHRAaW5pdGlhbFZpZXcgPSB2aWV3XG5cdFx0XHRAY3VycmVudFZpZXcgPSB2aWV3XG5cdFx0XHR2aWV3LnN0YXRlcy5zd2l0Y2hJbnN0YW50IFBVU0guQ0VOVEVSXG5cdFx0XHRAaGlzdG9yeS5wdXNoIHZpZXdcblx0XHRlbHNlXG5cdFx0XHR2aWV3LnN0YXRlcy5zd2l0Y2hJbnN0YW50IFBVU0guUklHSFRcblx0XHRcblx0XHR1bmxlc3Mgdmlldy5zdXBlckxheWVyIGlzIEAgb3IgdmlhSW50ZXJuYWxDaGFuZ2VFdmVudFxuXHRcdFx0dmlldy5zdXBlckxheWVyID0gQFxuXHRcdFx0XG5cdFx0QF9hcHBseUJhY2tCdXR0b24gdmlldyB1bmxlc3Mgdmlldy5uYW1lIGlzIEBpbml0aWFsVmlld05hbWVcblx0XHRcdFxuXHRcdEB2aWV3cy5wdXNoIHZpZXdcblxuXHR0cmFuc2l0aW9uOiAodmlldywgZGlyZWN0aW9uID0gRElSLlJJR0hULCBzd2l0Y2hJbnN0YW50ID0gZmFsc2UsIHByZXZlbnRIaXN0b3J5ID0gZmFsc2UpIC0+XG5cblx0XHRyZXR1cm4gZmFsc2UgaWYgdmlldyBpcyBAY3VycmVudFZpZXdcblx0XHRcblx0XHQjIFNldHVwIFZpZXdzIGZvciB0aGUgdHJhbnNpdGlvblxuXHRcdFxuXHRcdGlmIGRpcmVjdGlvbiBpcyBESVIuUklHSFRcblx0XHRcdHZpZXcuc3RhdGVzLnN3aXRjaEluc3RhbnQgIFBVU0guUklHSFRcblx0XHRcdEBjdXJyZW50Vmlldy5zdGF0ZXMuc3dpdGNoIFBVU0guTEVGVFxuXHRcdGVsc2UgaWYgZGlyZWN0aW9uIGlzIERJUi5ET1dOXG5cdFx0XHR2aWV3LnN0YXRlcy5zd2l0Y2hJbnN0YW50ICBQVVNILkRPV05cblx0XHRcdEBjdXJyZW50Vmlldy5zdGF0ZXMuc3dpdGNoIFBVU0guVVBcblx0XHRlbHNlIGlmIGRpcmVjdGlvbiBpcyBESVIuTEVGVFxuXHRcdFx0dmlldy5zdGF0ZXMuc3dpdGNoSW5zdGFudCAgUFVTSC5MRUZUXG5cdFx0XHRAY3VycmVudFZpZXcuc3RhdGVzLnN3aXRjaCBQVVNILlJJR0hUXG5cdFx0ZWxzZSBpZiBkaXJlY3Rpb24gaXMgRElSLlVQXG5cdFx0XHR2aWV3LnN0YXRlcy5zd2l0Y2hJbnN0YW50ICBQVVNILlVQXG5cdFx0XHRAY3VycmVudFZpZXcuc3RhdGVzLnN3aXRjaCBQVVNILkRPV05cblx0XHRlbHNlXG5cdFx0XHQjIElmIHRoZXkgc3BlY2lmaWVkIHNvbWV0aGluZyBkaWZmZXJlbnQganVzdCBzd2l0Y2ggaW1tZWRpYXRlbHlcblx0XHRcdHZpZXcuc3RhdGVzLnN3aXRjaEluc3RhbnQgUFVTSC5DRU5URVJcblx0XHRcdEBjdXJyZW50Vmlldy5zdGF0ZXMuc3dpdGNoSW5zdGFudCBQVVNILkxFRlRcblx0XHRcblx0XHQjIFB1c2ggdmlldyB0byBDZW50ZXJcblx0XHR2aWV3LnN0YXRlcy5zd2l0Y2ggUFVTSC5DRU5URVJcblx0XHQjIGN1cnJlbnRWaWV3IGlzIG5vdyBvdXIgcHJldmlvdXNWaWV3XG5cdFx0QHByZXZpb3VzVmlldyA9IEBjdXJyZW50Vmlld1xuXHRcdCMgU2V0IG91ciBjdXJyZW50VmlldyB0byB0aGUgdmlldyB3ZSdyZSBicmluZ2luZyBpblxuXHRcdEBjdXJyZW50VmlldyA9IHZpZXdcblxuXHRcdCMgU3RvcmUgdGhlIGxhc3QgdmlldyBpbiBoaXN0b3J5XG5cdFx0QGhpc3RvcnkucHVzaCBAcHJldmlvdXNWaWV3IGlmIHByZXZlbnRIaXN0b3J5IGlzIGZhbHNlXG5cdFx0XG5cdFx0QGVtaXQgRXZlbnRzLkNoYW5nZVxuXG5cdHJlbW92ZUJhY2tCdXR0b246ICh2aWV3KSAtPlxuXHRcdFV0aWxzLmRlbGF5IDAsID0+XG5cdFx0XHR2aWV3LnN1YkxheWVyc0J5TmFtZShCQUNLQlVUVE9OX1ZJRVdfTkFNRSlbMF0udmlzaWJsZSA9IGZhbHNlXG5cblx0YmFjazogLT5cblx0XHRAdHJhbnNpdGlvbihAX2dldExhc3RIaXN0b3J5SXRlbSgpLCBkaXJlY3Rpb24gPSBESVIuTEVGVCwgc3dpdGNoSW5zdGFudCA9IGZhbHNlLCBwcmV2ZW50SGlzdG9yeSA9IHRydWUpXG5cdFx0QGhpc3RvcnkucG9wKClcblxuXHRfZ2V0TGFzdEhpc3RvcnlJdGVtOiAtPlxuXHRcdHJldHVybiBAaGlzdG9yeVtAaGlzdG9yeS5sZW5ndGggLSAxXVxuXG5cdF9hcHBseUJhY2tCdXR0b246ICh2aWV3LCBmcmFtZSA9IEBiYWNrQnV0dG9uRnJhbWUpIC0+XG5cdFx0VXRpbHMuZGVsYXkgMCwgPT5cblx0XHRcdGlmIHZpZXcuYmFja0J1dHRvbiBpc250IGZhbHNlXG5cdFx0XHRcdGJhY2tCdXR0b24gPSBuZXcgTGF5ZXJcblx0XHRcdFx0XHRuYW1lOiBCQUNLQlVUVE9OX1ZJRVdfTkFNRVxuXHRcdFx0XHRcdHdpZHRoOiA4MFxuXHRcdFx0XHRcdGhlaWdodDogODBcblx0XHRcdFx0XHRzdXBlckxheWVyOiB2aWV3XG5cblx0XHRcdFx0aWYgQGRlYnVnTW9kZSBpcyBmYWxzZVxuXHRcdFx0XHRcdGJhY2tCdXR0b24uYmFja2dyb3VuZENvbG9yID0gXCJ0cmFuc3BhcmVudFwiXG5cblx0XHRcdFx0YmFja0J1dHRvbi5mcmFtZSA9IGZyYW1lXG5cblx0XHRcdFx0YmFja0J1dHRvbi5vbiBFdmVudHMuQ2xpY2ssID0+XG5cdFx0XHRcdFx0QGJhY2soKVxuXHRcdFxuICAgIFxuXG4jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjI1xuIyBVU0FHRSBFWEFNUExFIDEgLSBEZWZpbmUgSW5pdGlhbFZpZXdOYW1lICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyNcblxuIyBpbml0aWFsVmlld0tleSA9IFwidmlldzFcIlxuIyBcbiMgdm5jID0gbmV3IFZpZXdOYXZpZ2F0aW9uQ29udHJvbGxlciBpbml0aWFsVmlld05hbWU6IGluaXRpYWxWaWV3S2V5XG4jIHZpZXcxID0gbmV3IExheWVyXG4jIFx0bmFtZTogaW5pdGlhbFZpZXdLZXlcbiMgXHR3aWR0aDogIFNjcmVlbi53aWR0aFxuIyBcdGhlaWdodDogU2NyZWVuLmhlaWdodFxuIyBcdGJhY2tncm91bmRDb2xvcjogXCJyZWRcIlxuIyBcdHN1cGVyTGF5ZXI6IHZuY1xuXG4jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjI1xuIyBVU0FHRSBFWEFNUExFIDIgLSBVc2UgZGVmYXVsdCBpbml0aWFsVmlld05hbWUgXCJpbml0aWFsVmlld1wiICMjIyMjIyMjIyMjIyMjIyMjI1xuXG4jIHZuYyA9IG5ldyBWaWV3TmF2aWdhdGlvbkNvbnRyb2xsZXJcblxuIyB2aWV3MSA9IG5ldyBMYXllclxuIyBcdG5hbWU6IFwiaW5pdGlhbFZpZXdcIlxuIyBcdHdpZHRoOiAgU2NyZWVuLndpZHRoXG4jIFx0aGVpZ2h0OiBTY3JlZW4uaGVpZ2h0XG4jIFx0YmFja2dyb3VuZENvbG9yOiBcInJlZFwiXG4jIFx0c3VwZXJMYXllcjogdm5jXG5cdFxuIyB2aWV3MiA9IG5ldyBMYXllclxuIyBcdHdpZHRoOiAgU2NyZWVuLndpZHRoXG4jIFx0aGVpZ2h0OiBTY3JlZW4uaGVpZ2h0XG4jIFx0YmFja2dyb3VuZENvbG9yOiBcImdyZWVuXCJcbiMgXHRzdXBlckxheWVyOiB2bmNcblxuIyB2aWV3MS5vbiBFdmVudHMuQ2xpY2ssIC0+IHZuYy50cmFuc2l0aW9uIHZpZXcyXG4jIHZpZXcyLm9uIEV2ZW50cy5DbGljaywgLT4gdm5jLmJhY2soKVxuXHQiLCIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3ZhciBmPW5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIik7dGhyb3cgZi5jb2RlPVwiTU9EVUxFX05PVF9GT1VORFwiLGZ9dmFyIGw9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGwuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sbCxsLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUVBQTtBREFBLElBQUE7OztBQUFNLE9BQU8sQ0FBQztBQUdiLE1BQUE7Ozs7RUFBQSxpQkFBQSxHQUFvQjs7RUFDcEIsb0JBQUEsR0FBdUI7O0VBQ3ZCLGlCQUFBLEdBQ0M7SUFBQSxJQUFBLEVBQU0sR0FBTjtJQUNBLEtBQUEsRUFBTyxhQURQOzs7RUFFRCxpQkFBQSxHQUNDO0lBQUEsQ0FBQSxFQUFHLENBQUg7SUFDQSxDQUFBLEVBQUcsRUFESDtJQUVBLEtBQUEsRUFBTyxFQUZQO0lBR0EsTUFBQSxFQUFRLEVBSFI7OztFQUlELElBQUEsR0FDQztJQUFBLEVBQUEsRUFBUSxRQUFSO0lBQ0EsSUFBQSxFQUFRLFVBRFI7SUFFQSxJQUFBLEVBQVEsVUFGUjtJQUdBLEtBQUEsRUFBUSxXQUhSO0lBSUEsTUFBQSxFQUFRLFlBSlI7OztFQUtELEdBQUEsR0FDQztJQUFBLEVBQUEsRUFBTyxJQUFQO0lBQ0EsSUFBQSxFQUFPLE1BRFA7SUFFQSxJQUFBLEVBQU8sTUFGUDtJQUdBLEtBQUEsRUFBTyxPQUhQOzs7RUFJRCxVQUFBLEdBQWE7O0VBR0Esa0NBQUMsT0FBRDtBQUVaLFFBQUE7SUFGYSxJQUFDLENBQUEsNEJBQUQsVUFBUztJQUV0QixJQUFDLENBQUEsS0FBRCxHQUFTLElBQUMsQ0FBQSxPQUFELEdBQVcsSUFBQyxDQUFBLFdBQUQsR0FBZSxJQUFDLENBQUEsV0FBRCxH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
