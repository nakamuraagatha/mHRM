// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//   JQUERY VALIDATE -->
//=  require plugin/jquery-validate/jquery.validate.min.js
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require cocoon
//= require dataTables/jquery.dataTables
//= require plugin/datatables/dataTables.colVis.min.js
//= require plugin/datatables/dataTables.tableTools.min.js
//= require plugin/datatables/dataTables.bootstrap.min.js
//= require plugin/datatable-responsive/datatables.responsive.min.js
//= require buttons.colVis.min
//= require dataTables.buttons.min

//= require ckeditor-jquery

$(function(){
    $('.date_picker').datepicker({ dateFormat: 'dd-mm-yy' })
})

