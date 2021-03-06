angular.module("admin.tagRules").directive 'newTagRuleDialog', ($compile, $templateCache, $window) ->
  restrict: 'A'
  scope: true
  link: (scope, element, attr) ->
    # Compile modal template
    template = $compile($templateCache.get('admin/new_tag_rule_dialog.html'))(scope)

    scope.ruleTypes = [
      # { id: "DiscountOrder", name: 'Apply a discount to orders' }
      { id: "FilterShippingMethods", name: 'Show/Hide shipping methods' }
    ]

    scope.ruleType = "DiscountOrder"

    # Set Dialog options
    template.dialog
      show: { effect: "fade", duration: 400 }
      hide: { effect: "fade", duration: 300 }
      autoOpen: false
      resizable: false
      width: $window.innerWidth * 0.4;
      modal: true
      open: (event, ui) ->
        $('.ui-widget-overlay').bind 'click', ->
          $(this).siblings('.ui-dialog').find('.ui-dialog-content').dialog('close')

    # Link opening of dialog to click event on element
    element.bind 'click', (e) ->
      template.dialog('open')

    scope.addRule = (tagGroup, ruleType) ->
      scope.addNewRuleTo(tagGroup, ruleType)
      template.dialog('close')
      return
