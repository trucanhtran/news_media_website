$("#id_show_admin").html("<%= escape_javascript(render partial: 'show_admin', locals: { user: @user } ) %>");
