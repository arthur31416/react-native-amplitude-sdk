require "json"

json = File.read(File.join(__dir__, "package.json"))
package = JSON.parse(json).deep_symbolize_keys

Pod::Spec.new do |s|
  s.name = package[:name]
  s.version = package[:version]
  s.license = { type: "MIT" }
  s.homepage = package[:homepage]
  s.authors = package[:contributors].flat_map { |author| { author[:name] => author[:email] } }
  s.summary = package[:description]
  s.source = { git: package[:repository][:url] }
  s.source_files = "ios/*.{h,m}"
  s.platform = :ios, "8.0"

  s.dependency "Amplitude-iOS", "~> 3.10.1"
  s.dependency "React"
end
