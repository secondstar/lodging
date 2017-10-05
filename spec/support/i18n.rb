RSpec.configure do |config|
  config.include ActionView::Helpers::TranslationHelper
  en:
  hotels:
    index:
      title: "WDW Hub|Walt Disney World Hotels"
    show:
      title: "Choose %{name}!"
end
