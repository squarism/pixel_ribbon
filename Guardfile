# guard options are too long for the rspec line, so set them here
guard_options = {
  :all_after_pass => false,
  :all_on_start => false,
  :cli => '-c -f doc'
}

guard 'rspec', guard_options do
  watch(%r{^spec/.+_spec\.rb$}) {|m| m}
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
