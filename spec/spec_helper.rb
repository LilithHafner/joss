# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause this
# file to always be loaded, without a need to explicitly require it in any files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'capybara/rspec'

RSpec.configure do |config|

  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    # GAAAAAHHHHH https://github.com/rspec/rspec-rails/issues/1076
    mocks.verify_partial_doubles = false
  end

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Limits the available syntax to the non-monkey patched syntax that is recommended.
  # For more details, see:
  #   - http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
  #   - http://teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://myronmars.to/n/dev-blog/2014/05/notable-changes-in-rspec-3#new__config_option_to_disable_rspeccore_monkey_patching
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, "https://api.github.com/repos/openjournals/joss-reviews-testing/issues").
      with(body: "{\"labels\":[\"review\"],\"title\":\"[REVIEW]: arfon / fidgit\",\"body\":\"**Submitting author:** @foobar (\\u003ca href=\\\"http://orcid.org/0000-0000-0000-1234\\\"\\u003eDoe, John\\u003c/a\\u003e)\\n**Repository:** \\u003ca href=\\\"http://github.com/arfon/fidgit\\\" target =\\\"_blank\\\"\\u003ehttp://github.com/arfon/fidgit\\u003c/a\\u003e\\n**Version:** v1.0.0\\n**Editor:** @mouse\\n**Reviewer:** @mickey\\n\\n## Status\\n\\n[![status](http://joss.theoj.org/papers/48d24b0158528e85ac7706aecd8cddc4/status.svg)](http://joss.theoj.org/papers/48d24b0158528e85ac7706aecd8cddc4)\\n\\nStatus badge code:\\n\\n```\\nHTML: \\u003ca href=\\\"http://joss.theoj.org/papers/48d24b0158528e85ac7706aecd8cddc4\\\"\\u003e\\u003cimg src=\\\"http://joss.theoj.org/papers/48d24b0158528e85ac7706aecd8cddc4/status.svg\\\"\\u003e\\u003c/a\\u003e\\nMarkdown: [![status](http://joss.theoj.org/papers/48d24b0158528e85ac7706aecd8cddc4/status.svg)](http://joss.theoj.org/papers/48d24b0158528e85ac7706aecd8cddc4)\\n```\\n**Reviewers and authors**:\\n\\nPlease avoid lengthy details of difficulties in the review thread. Instead, please create a new issue in the \\u003ca href=\\\"http://github.com/arfon/fidgit\\\" target=\\\"_blank\\\"\\u003etarget repository\\u003c/a\\u003e and link to those issues (especially acceptance-blockers) in the review thread below. (For completists: if the target issue tracker is also on GitHub, linking the review thread in the issue or vice versa will create corresponding breadcrumb trails in the link target.)\\n\\n## Reviewer questions\\n\\n### Conflict of interest\\n\\n- [ ] As the reviewer I confirm that there are no conflicts of interest for me to review this work (such as being a major contributor to the software).\\n\\n### Code of Conduct\\n\\n- [ ] I confirm that I read and will adhere to the [JOSS code of conduct](http://joss.theoj.org/about#code_of_conduct).\\n\\n### General checks\\n\\n- [ ] **Repository:** Is the source code for this software available at the \\u003ca target=\\\"_blank\\\" href=\\\"http://github.com/arfon/fidgit\\\"\\u003erepository url\\u003c/a\\u003e?\\n- [ ] **License:** Does the repository contain a plain-text LICENSE file with the contents of an [OSI approved](https://opensource.org/licenses/alphabetical) software license?\\n- [ ] **Version:** Does the release version given match the GitHub release (v1.0.0)?\\n- [ ] **Authorship:** Has the submitting author (@foobar) made major contributions to the software? Does the full list of paper authors seem appropriate and complete?\\n\\n### Functionality\\n\\n- [ ] **Installation:** Does installation proceed as outlined in the documentation?\\n- [ ] **Functionality:** Have the functional claims of the software been confirmed?\\n- [ ] **Performance:** If there are any performance claims of the software, have they been confirmed? (If there are no claims, please check off this item.)\\n\\n### Documentation\\n\\n- [ ] **A statement of need:** Do the authors clearly state what problems the software is designed to solve and who the target audience is?\\n- [ ] **Installation instructions:** Is there a clearly-stated list of dependencies? Ideally these should be handled with an automated package management solution.\\n- [ ] **Example usage:** Do the authors include examples of how to use the software (ideally to solve real-world analysis problems).\\n- [ ] **Functionality documentation:** Is the core functionality of the software documented to a satisfactory level (e.g., API method documentation)?\\n- [ ] **Automated tests:** Are there automated tests or manual steps described so that the function of the software can be verified?\\n- [ ] **Community guidelines:** Are there clear guidelines for third parties wishing to 1) Contribute to the software 2) Report issues or problems with the software 3) Seek support\\n\\n### Software paper\\n\\n- [ ] **Authors:** Does the `paper.md` file include a list of authors with their affiliations?\\n- [ ] **A statement of need:** Do the authors clearly state what problems the software is designed to solve and who the target audience is?\\n- [ ] **References:** Do all archival references that should have a DOI list one (e.g., papers, datasets, software)?\\n\"}",
          headers: {'Accept'=>'application/vnd.github.v3+json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Octokit Ruby Gem 4.3.0'}).
      to_return(status: 200, body: "", headers: {})
    stub_request(:post, "https://api.github.com/repos/openjournals/joss-reviews-testing/issues").
      with(body: "{\"assignee\":\"joss\",\"labels\":[\"pre-review\"],\"title\":\"[PRE REVIEW]: arfon / fidgit\",\"body\":\"**Submitting author:** @foobar (\\u003ca href=\\\"http://orcid.org/0000-0000-0000-1234\\\"\\u003eDoe, John\\u003c/a\\u003e)\\n**Repository:** \\u003ca href=\\\"http://github.com/arfon/fidgit\\\" target =\\\"_blank\\\"\\u003ehttp://github.com/arfon/fidgit\\u003c/a\\u003e\\n**Version:** v1.0.0\\n**Editor:** @joss\\n**Reviewer:** Pending\\n\\n**What this issue is for**\\n\\nThanks for submitting your paper to JOSS @foobar. The JOSS editor (shown at the top of this issue) will work with you on this issue to find a reviewer for your submission before creating the main review issue.\\n\\n**Editor instructions**\\n\\nThe JOSS submission bot @whedon is here to help you find and assign reviewers and start the main review. To find out what @whedon can do for you type:\\n\\n```\\n@whedon commands\\n```\\n\"}",
           headers: {'Accept'=>'application/vnd.github.v3+json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Octokit Ruby Gem 4.3.0'}).
      to_return(status: 200, body: "", headers: {})
    stub_request(:get, "https://www.theoj.org/joss-papers/joss.00000/10.21105.jcon.00000.pdf").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Ruby'
           }).
         to_return(status: 200, body: IO.binread('spec/fixtures/paper.pdf'), headers: {})
  end
end
