task :deploy do
  system 'git checkout master'
  system 'rm -rf ./_site'
  system 'mkdir _site'
  system 'jekyll'
  system 'rm -rf ../_site'
  system 'cp -r ./_site ../_site'
  system 'git checkout gh-pages'
  Dir[`pwd`[0..-2] + "/*"].each do |file|
    skip = ["CNAME", "sitemap", "Rakefile", "README"]
    next if file.include? "CNAME" or file.include? "sitemap" or file.include? "Rakefile"
    begin
      FileUtils.rm_rf(file)
    rescue
      FileUtils.rm(file)
    end
  end
  system 'mv ../_site/* ./'
  system 'git status'
  msg = `git status`
  system 'git add .'
  system "git commit -m 'Sync gh-pages \n #{msg}'"
  system 'git push origin gh-pages'
  system 'git checkout master'
  system 'rm -rf ../_site'
end