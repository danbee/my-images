module AuthHelpers
  def sign_in
    visit "/"

    within(".centre-stage") do
      click_link("Sign in with GitHub")
    end
  end
end
