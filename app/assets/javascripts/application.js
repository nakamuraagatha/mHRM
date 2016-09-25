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
//= require plugin/select2/select2.min.js

$(function(){
    $('.date_picker').datepicker({ dateFormat: 'dd-mm-yy' })
    $( ".use_select2" ).select2({
        theme: "bootstrap"
    });

    $('#ul_menu').on('click', function(){
        if(readCookie('admin_menu')){
            eraseCookie('admin_menu');
        }
        else
        {
            createCookie('admin_menu', true, 7);
        }
    });
    set_ul_menu()
})

function set_ul_menu()
{
    if(readCookie('admin_menu'))
    {
        $('#admin_menu').addClass('display_block');
    }
}

function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name,"",-1);
}

