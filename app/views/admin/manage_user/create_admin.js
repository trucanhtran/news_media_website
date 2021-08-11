$("#id_show_admins").html("<%= escape_javascript(render partial: 'new_admin', locals: {user: @user } ) %>");
