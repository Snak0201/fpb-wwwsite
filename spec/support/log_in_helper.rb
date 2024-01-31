module LogInHelpers
  def admin_log_in(admin)
    visit new_admin_session_path
    fill_in 'Eメール', with: admin.email
    fill_in 'パスワード', with: admin.password
    click_on 'Log in'
  end
end
