module AuthHelpers
  def sign_in
    allow_any_instance_of(SessionsController).
      to receive(:in_organization?).
      and_return(true)

    visit "/"

    within(".centre-stage") do
      click_link("Sign in with GitHub")
    end
  end
end
