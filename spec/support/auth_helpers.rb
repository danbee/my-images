module AuthHelpers
  def sign_in(user = fake_user)
    mock_oauth(user.uid)
    allow_any_instance_of(SessionsController).
      to receive(:in_organization?).
      and_return(true)

    visit "/"

    within(".centre-stage") do
      click_link("Sign in with GitHub")
    end
  end

  private

  def fake_user
    OpenStruct.new(uid: SecureRandom.hex(10))
  end

  def mock_oauth(uid)
    OmniAuth.config.add_mock(
      :github,
      provider: "github",
      uid: uid,
      credentials: { token: "12345" },
    )
  end
end
