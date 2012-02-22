


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>plugins/brew/brew.plugin.zsh at master from robbyrussell/oh-my-zsh - GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

    
    

    <meta content="authenticity_token" name="csrf-param" />
<meta content="WIrOaiVwA4brnyUxeXoIqAyDpbRKl0gF03UtdW+Kgyk=" name="csrf-token" />

    <link href="https://a248.e.akamai.net/assets.github.com/stylesheets/bundles/github-6355f1efcaaf6354fec01748788b30b022a31580.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="https://a248.e.akamai.net/assets.github.com/stylesheets/bundles/github2-98c3ef313c69893a7c6710ab40227ad8bc8eb0d3.css" media="screen" rel="stylesheet" type="text/css" />
    

    <script src="https://a248.e.akamai.net/assets.github.com/javascripts/bundles/jquery-1ff4761a0d9866a948321eac8d969db3dc12938e.js" type="text/javascript"></script>
    <script src="https://a248.e.akamai.net/assets.github.com/javascripts/bundles/github-675e2eb8f08da957439f1f28526d8511e4731e84.js" type="text/javascript"></script>
    

      <link rel='permalink' href='/robbyrussell/oh-my-zsh/blob/1120f973054836eeb53750f57d69fbec41a340dc/plugins/brew/brew.plugin.zsh'>
    <meta property="og:title" content="oh-my-zsh"/>
    <meta property="og:type" content="githubog:gitrepository"/>
    <meta property="og:url" content="https://github.com/robbyrussell/oh-my-zsh"/>
    <meta property="og:image" content="https://a248.e.akamai.net/assets.github.com/images/gravatars/gravatar-140.png?1329275960"/>
    <meta property="og:site_name" content="GitHub"/>
    <meta property="og:description" content="oh-my-zsh - A community-driven framework for managing your zsh configuration. Includes 40+ optional plugins (rails, git, OSX, hub, capistrano, brew, ant, macports, etc), over 80 terminal themes to spice up  your morning, and an auto-update tool so that makes it easy to keep up with the latest updates from the community."/>

    <meta name="description" content="oh-my-zsh - A community-driven framework for managing your zsh configuration. Includes 40+ optional plugins (rails, git, OSX, hub, capistrano, brew, ant, macports, etc), over 80 terminal themes to spice up  your morning, and an auto-update tool so that makes it easy to keep up with the latest updates from the community." />
  <link href="https://github.com/robbyrussell/oh-my-zsh/commits/master.atom" rel="alternate" title="Recent Commits to oh-my-zsh:master" type="application/atom+xml" />

  </head>


  <body class="logged_in page-blob  vis-public env-production " data-blob-contribs-enabled="no">
    


    

      <div id="header" class="true clearfix">
        <div class="container clearfix">
          <a class="site-logo" href="https://github.com/">
            <!--[if IE]>
            <img alt="GitHub" class="github-logo" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7.png?1323882778" />
            <img alt="GitHub" class="github-logo-hover" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7-hover.png?1324325424" />
            <![endif]-->
            <img alt="GitHub" class="github-logo-4x" height="30" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7@4x.png?1323882778" />
            <img alt="GitHub" class="github-logo-4x-hover" height="30" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7@4x-hover.png?1324325424" />
          </a>

              
    <div class="topsearch ">
<form action="/search" id="top_search_form" method="get">        <a href="/search" class="advanced-search tooltipped downwards" title="Advanced Search">Advanced Search</a>
        <div class="search placeholder-field js-placeholder-field">
          <label class="placeholder" for="global-search-field">Search…</label>
          <input type="text" class="search my_repos_autocompleter" id="global-search-field" name="q" results="5" spellcheck="false" autocomplete="off" data-autocomplete="my-repos-autocomplete">
          <div id="my-repos-autocomplete" class="autocomplete-results">
            <ul class="js-navigation-container"></ul>
          </div>
          <input type="submit" value="Search" class="button">
        </div>
        <input type="hidden" name="type" value="Everything" />
        <input type="hidden" name="repo" value="" />
        <input type="hidden" name="langOverride" value="" />
        <input type="hidden" name="start_value" value="1" />
</form>      <ul class="top-nav">
          <li class="explore"><a href="https://github.com/explore">Explore</a></li>
          <li><a href="https://gist.github.com">Gist</a></li>
          <li><a href="/blog">Blog</a></li>
        <li><a href="http://help.github.com">Help</a></li>
      </ul>
    </div>


            


  <div id="userbox">
    <div id="user">
      <a href="https://github.com/Kusold"><img height="20" src="https://secure.gravatar.com/avatar/9b67c2cc60aaf00368d13a60f46a2d40?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png" width="20" /></a>
      <a href="https://github.com/Kusold" class="name">Kusold</a>
    </div>
    <ul id="user-links">
      <li>
        <a href="/inbox/notifications" id="notifications" class="tooltipped downwards" title="Notifications">
          <span class="icon">Notifications</span>
          <span class="unread_count">2</span>
        </a>
      </li>
      <li><a href="/settings/profile" id="settings" class="tooltipped downwards" title="Account Settings"><span class="icon">Account Settings</span></a></li>
      <li><a href="/logout" id="logout" class="tooltipped downwards" title="Log Out"><span class="icon">Log Out</span></a></li>
    </ul>
  </div>



          
        </div>
      </div>

      

            <div class="site">
      <div class="container">
        <div class="pagehead repohead instapaper_ignore readability-menu">
        <div class="title-actions-bar">
          <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
<a href="/robbyrussell" itemprop="url">            <span itemprop="title">robbyrussell</span>
            </a> /
            <strong><a href="/robbyrussell/oh-my-zsh" class="js-current-repository">oh-my-zsh</a></strong>
          </h1>
          



              <ul class="pagehead-actions">


          <li class="js-toggler-container watch-button-container ">
            <a href="/robbyrussell/oh-my-zsh/toggle_watch" class="minibutton btn-watch watch-button js-toggler-target" data-method="post" data-remote="true" rel="nofollow"><span><span class="icon"></span>Watch</span></a>
            <a href="/robbyrussell/oh-my-zsh/toggle_watch" class="minibutton btn-watch unwatch-button js-toggler-target" data-method="post" data-remote="true" rel="nofollow"><span><span class="icon"></span>Unwatch</span></a>
          </li>

              <li><a href="/Kusold/oh-my-zsh" class="minibutton btn-fork "><span><span class="icon"></span>Your Fork</span></a></li>



      <li class="repostats">
        <ul class="repo-stats">
          <li class="watchers ">
            <a href="/robbyrussell/oh-my-zsh/watchers" title="Watchers" class="tooltipped downwards">
              4,459
            </a>
          </li>
          <li class="forks">
            <a href="/robbyrussell/oh-my-zsh/network" title="Forks - You have a fork" class="tooltipped downwards">
              1,727
            </a>
          </li>
        </ul>
      </li>
    </ul>

        </div>

          

  <ul class="tabs">
    <li><a href="/robbyrussell/oh-my-zsh" class="selected" highlight="repo_sourcerepo_downloadsrepo_commitsrepo_tagsrepo_branches">Code</a></li>
    <li><a href="/robbyrussell/oh-my-zsh/network" highlight="repo_networkrepo_fork_queue">Network</a>
    <li><a href="/robbyrussell/oh-my-zsh/pulls" highlight="repo_pulls">Pull Requests <span class='counter'>260</span></a></li>

      <li><a href="/robbyrussell/oh-my-zsh/issues" highlight="repo_issues">Issues <span class='counter'>375</span></a></li>

      <li><a href="/robbyrussell/oh-my-zsh/wiki" highlight="repo_wiki">Wiki <span class='counter'>9</span></a></li>

    <li><a href="/robbyrussell/oh-my-zsh/graphs" highlight="repo_graphsrepo_contributors">Stats &amp; Graphs</a></li>

  </ul>

  
<div class="frame frame-center tree-finder" style="display:none"
      data-tree-list-url="/robbyrussell/oh-my-zsh/tree-list/1120f973054836eeb53750f57d69fbec41a340dc"
      data-blob-url-prefix="/robbyrussell/oh-my-zsh/blob/1120f973054836eeb53750f57d69fbec41a340dc"
    >

  <div class="breadcrumb">
    <span class="bold"><a href="/robbyrussell/oh-my-zsh">oh-my-zsh</a></span> /
    <input class="tree-finder-input js-navigation-enable" type="text" name="query" autocomplete="off" spellcheck="false">
  </div>

    <div class="octotip">
      <p>
        <a href="/robbyrussell/oh-my-zsh/dismiss-tree-finder-help" class="dismiss js-dismiss-tree-list-help" title="Hide this notice forever" rel="nofollow">Dismiss</a>
        <span class="bold">Octotip:</span> You've activated the <em>file finder</em>
        by pressing <span class="kbd">t</span> Start typing to filter the
        file list. Use <span class="kbd badmono">↑</span> and
        <span class="kbd badmono">↓</span> to navigate,
        <span class="kbd">enter</span> to view files.
      </p>
    </div>

  <table class="tree-browser" cellpadding="0" cellspacing="0">
    <tr class="js-header"><th>&nbsp;</th><th>name</th></tr>
    <tr class="js-no-results no-results" style="display: none">
      <th colspan="2">No matching files</th>
    </tr>
    <tbody class="js-results-list js-navigation-container">
    </tbody>
  </table>
</div>

<div id="jump-to-line" style="display:none">
  <h2>Jump to Line</h2>
  <form>
    <input class="textfield" type="text">
    <div class="full-button">
      <button type="submit" class="classy">
        <span>Go</span>
      </button>
    </div>
  </form>
</div>


<div class="subnav-bar">

  <ul class="actions subnav">
    <li><a href="/robbyrussell/oh-my-zsh/tags" class="blank" highlight="repo_tags">Tags <span class="counter">0</span></a></li>
    <li><a href="/robbyrussell/oh-my-zsh/downloads" class="blank downloads-blank" highlight="repo_downloads">Downloads <span class="counter">0</span></a></li>
    
  </ul>

  <ul class="scope">
    <li class="switcher">

      <div class="context-menu-container js-menu-container">
        <a href="#"
           class="minibutton bigger switcher js-menu-target js-commitish-button btn-branch repo-tree"
           data-master-branch="master"
           data-ref="master">
          <span><span class="icon"></span><i>branch:</i> master</span>
        </a>

        <div class="context-pane commitish-context js-menu-content">
          <a href="javascript:;" class="close js-menu-close"></a>
          <div class="context-title">Switch Branches/Tags</div>
          <div class="context-body pane-selector commitish-selector js-filterable-commitishes">
            <div class="filterbar">
              <div class="placeholder-field js-placeholder-field">
                <label class="placeholder" for="context-commitish-filter-field" data-placeholder-mode="sticky">Filter branches/tags</label>
                <input type="text" id="context-commitish-filter-field" class="commitish-filter" />
              </div>

              <ul class="tabs">
                <li><a href="#" data-filter="branches" class="selected">Branches</a></li>
                <li><a href="#" data-filter="tags">Tags</a></li>
              </ul>
            </div>

              <div class="commitish-item branch-commitish selector-item">
                <h4>
                    <a href="/robbyrussell/oh-my-zsh/blob/master/plugins/brew/brew.plugin.zsh" data-name="master" rel="nofollow">master</a>
                </h4>
              </div>
              <div class="commitish-item branch-commitish selector-item">
                <h4>
                    <a href="/robbyrussell/oh-my-zsh/blob/nel-fix-title-bar/plugins/brew/brew.plugin.zsh" data-name="nel-fix-title-bar" rel="nofollow">nel-fix-title-bar</a>
                </h4>
              </div>
              <div class="commitish-item branch-commitish selector-item">
                <h4>
                    <a href="/robbyrussell/oh-my-zsh/blob/plugins/plugins/brew/brew.plugin.zsh" data-name="plugins" rel="nofollow">plugins</a>
                </h4>
              </div>


            <div class="no-results" style="display:none">Nothing to show</div>
          </div>
        </div><!-- /.commitish-context-context -->
      </div>

    </li>
  </ul>

  <ul class="subnav with-scope">

    <li><a href="/robbyrussell/oh-my-zsh" class="selected" highlight="repo_source">Files</a></li>
    <li><a href="/robbyrussell/oh-my-zsh/commits/master" highlight="repo_commits">Commits</a></li>
    <li><a href="/robbyrussell/oh-my-zsh/branches" class="" highlight="repo_branches" rel="nofollow">Branches <span class="counter">3</span></a></li>
  </ul>

</div>

  
  
  


          

        </div><!-- /.repohead -->

        




    
  <p class="last-commit">Latest commit to the <strong>master</strong> branch</p>

<div class="commit commit-tease js-details-container">
  <p class="commit-title ">
      <a href="/robbyrussell/oh-my-zsh/commit/1120f973054836eeb53750f57d69fbec41a340dc" class="message">Merge pull request </a><a href="https://github.com/robbyrussell/oh-my-zsh/issues/958" title="URGENT: Fix for bug introduced in pull request 925" class="issue-link">#958</a><a href="/robbyrussell/oh-my-zsh/commit/1120f973054836eeb53750f57d69fbec41a340dc" class="message"> from cruser42/master</a>
      <a href="javascript:;" class="minibutton expander-minibutton js-details-target"><span>…</span></a>
  </p>
    <div class="commit-desc"><pre>URGENT: Fix for bug introduced in pull request 925</pre></div>
  <div class="commit-meta">
    <a href="/robbyrussell/oh-my-zsh/commit/1120f973054836eeb53750f57d69fbec41a340dc" class="sha-block">commit <span class="sha">1120f97305</span></a>
    <span class="js-clippy clippy-button " data-clipboard-text="1120f973054836eeb53750f57d69fbec41a340dc" data-copied-hint="copied!" data-copy-hint="Copy SHA"></span>

    <div class="authorship">
      <img class="gravatar" height="20" src="https://secure.gravatar.com/avatar/e37dd67cee953393c54da70ac7723e3d?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png" width="20" />
      <span class="author-name"><a href="/eddorre">eddorre</a></span>
      authored <time class="js-relative-date" datetime="2012-02-21T09:45:49-08:00" title="2012-02-21 09:45:49">February 21, 2012</time>

    </div>
  </div>
</div>


<!-- block_view_fragment_key: views4/v8/blob:v17:6e50ee878776c85cbd9bd60d7c51fbf7 -->
  <div id="slider">

    <div class="breadcrumb" data-path="plugins/brew/brew.plugin.zsh/">
      <b itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/robbyrussell/oh-my-zsh/tree/1120f973054836eeb53750f57d69fbec41a340dc" class="js-rewrite-sha" itemprop="url"><span itemprop="title">oh-my-zsh</span></a></b> / <span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/robbyrussell/oh-my-zsh/tree/1120f973054836eeb53750f57d69fbec41a340dc/plugins" class="js-rewrite-sha" itemscope="url"><span itemprop="title">plugins</span></a></span> / <span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/robbyrussell/oh-my-zsh/tree/1120f973054836eeb53750f57d69fbec41a340dc/plugins/brew" class="js-rewrite-sha" itemscope="url"><span itemprop="title">brew</span></a></span> / <strong class="final-path">brew.plugin.zsh</strong> <span class="js-clippy clippy-button " data-clipboard-text="plugins/brew/brew.plugin.zsh" data-copied-hint="copied!" data-copy-hint="copy to clipboard"></span>
    </div>



    <div class="frames">
      <div class="frame frame-center" data-path="plugins/brew/brew.plugin.zsh/" data-permalink-url="/robbyrussell/oh-my-zsh/blob/1120f973054836eeb53750f57d69fbec41a340dc/plugins/brew/brew.plugin.zsh" data-title="plugins/brew/brew.plugin.zsh at master from robbyrussell/oh-my-zsh - GitHub" data-type="blob">

        <div id="files" class="bubble">
          <div class="file">
            <div class="meta">
              <div class="info">
                <span class="icon"><img alt="Txt" height="16" src="https://a248.e.akamai.net/assets.github.com/images/icons/txt.png?1252203928" width="16" /></span>
                <span class="mode" title="File Mode">100644</span>
                  <span>2 lines (1 sloc)</span>
                <span>0.027 kb</span>
              </div>
              <ul class="actions">
                  <li>
                    <a class="file-edit-link minibutton bigger lighter js-rewrite-sha" href="/robbyrussell/oh-my-zsh/edit/1120f973054836eeb53750f57d69fbec41a340dc/plugins/brew/brew.plugin.zsh" data-method="post" rel="nofollow"><span>Edit this file</span></a>
                  </li>

                <li>
                  <a href="/robbyrussell/oh-my-zsh/raw/master/plugins/brew/brew.plugin.zsh" class="minibutton btn-raw bigger lighter" id="raw-url"><span><span class="icon"></span>Raw</span></a>
                </li>
                  <li>
                    <a href="/robbyrussell/oh-my-zsh/blame/master/plugins/brew/brew.plugin.zsh" class="minibutton btn-blame bigger lighter"><span><span class="icon"></span>Blame</span></a>
                  </li>
                <li>
                  <a href="/robbyrussell/oh-my-zsh/commits/master/plugins/brew/brew.plugin.zsh" class="minibutton btn-history bigger lighter" rel="nofollow"><span><span class="icon"></span>History</span></a>
                </li>
              </ul>
            </div>
              <div class="data type-shell">
      <table cellpadding="0" cellspacing="0" class="lines">
        <tr>
          <td>
            <pre class="line_numbers"><span id="L1" rel="#L1">1</span>
</pre>
          </td>
          <td width="100%">
                <div class="highlight"><pre><div class='line' id='LC1'><span class="nb">alias </span><span class="nv">brews</span><span class="o">=</span><span class="s1">&#39;brew list -1&#39;</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

          </div>
        </div>
      </div>
    </div>

  </div>

<div class="frame frame-loading large-loading-area" style="display:none;" data-tree-list-url="/robbyrussell/oh-my-zsh/tree-list/1120f973054836eeb53750f57d69fbec41a340dc" data-blob-url-prefix="/robbyrussell/oh-my-zsh/blob/1120f973054836eeb53750f57d69fbec41a340dc">
  <img src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-64.gif?1329872008" height="64" width="64">
</div>

      </div>
      <div class="context-overlay"></div>
    </div>


      <!-- footer -->
      <div id="footer" >
        
  <div class="upper_footer">
     <div class="container clearfix">

       <!--[if IE]><h4 id="blacktocat_ie">GitHub Links</h4><![endif]-->
       <![if !IE]><h4 id="blacktocat">GitHub Links</h4><![endif]>

       <ul class="footer_nav">
         <h4>GitHub</h4>
         <li><a href="https://github.com/about">About</a></li>
         <li><a href="https://github.com/blog">Blog</a></li>
         <li><a href="https://github.com/features">Features</a></li>
         <li><a href="https://github.com/contact">Contact &amp; Support</a></li>
         <li><a href="https://github.com/training">Training</a></li>
         <li><a href="http://enterprise.github.com/">GitHub Enterprise</a></li>
         <li><a href="http://status.github.com/">Site Status</a></li>
       </ul>

       <ul class="footer_nav">
         <h4>Tools</h4>
         <li><a href="http://get.gaug.es/">Gauges: Analyze web traffic</a></li>
         <li><a href="http://speakerdeck.com">Speaker Deck: Presentations</a></li>
         <li><a href="https://gist.github.com">Gist: Code snippets</a></li>
         <li><a href="http://mac.github.com/">GitHub for Mac</a></li>
         <li><a href="http://mobile.github.com/">Issues for iPhone</a></li>
         <li><a href="http://jobs.github.com/">Job Board</a></li>
       </ul>

       <ul class="footer_nav">
         <h4>Extras</h4>
         <li><a href="http://shop.github.com/">GitHub Shop</a></li>
         <li><a href="http://octodex.github.com/">The Octodex</a></li>
       </ul>

       <ul class="footer_nav">
         <h4>Documentation</h4>
         <li><a href="http://help.github.com/">GitHub Help</a></li>
         <li><a href="http://developer.github.com/">Developer API</a></li>
         <li><a href="http://github.github.com/github-flavored-markdown/">GitHub Flavored Markdown</a></li>
         <li><a href="http://pages.github.com/">GitHub Pages</a></li>
       </ul>

     </div><!-- /.site -->
  </div><!-- /.upper_footer -->

<div class="lower_footer">
  <div class="container clearfix">
    <!--[if IE]><div id="legal_ie"><![endif]-->
    <![if !IE]><div id="legal"><![endif]>
      <ul>
          <li><a href="https://github.com/site/terms">Terms of Service</a></li>
          <li><a href="https://github.com/site/privacy">Privacy</a></li>
          <li><a href="https://github.com/security">Security</a></li>
      </ul>

      <p>&copy; 2012 <span title="0.17679s from fe6.rs.github.com">GitHub</span> Inc. All rights reserved.</p>
    </div><!-- /#legal or /#legal_ie-->

      <div class="sponsor">
        <a href="http://www.rackspace.com" class="logo">
          <img alt="Dedicated Server" height="36" src="https://a248.e.akamai.net/assets.github.com/images/modules/footer/rackspaces_logo.png?1329521041" width="38" />
        </a>
        Powered by the <a href="http://www.rackspace.com ">Dedicated
        Servers</a> and<br/> <a href="http://www.rackspacecloud.com">Cloud
        Computing</a> of Rackspace Hosting<span>&reg;</span>
      </div>
  </div><!-- /.site -->
</div><!-- /.lower_footer -->

      </div><!-- /#footer -->

    

<div id="keyboard_shortcuts_pane" class="instapaper_ignore readability-extra" style="display:none">
  <h2>Keyboard Shortcuts <small><a href="#" class="js-see-all-keyboard-shortcuts">(see all)</a></small></h2>

  <div class="columns threecols">
    <div class="column first">
      <h3>Site wide shortcuts</h3>
      <dl class="keyboard-mappings">
        <dt>s</dt>
        <dd>Focus site search</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>?</dt>
        <dd>Bring up this help dialog</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column middle" style='display:none'>
      <h3>Commit list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selection down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selection up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>c <em>or</em> o <em>or</em> enter</dt>
        <dd>Open commit</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>y</dt>
        <dd>Expand URL to its canonical form</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column last" style='display:none'>
      <h3>Pull request list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selection down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selection up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>o <em>or</em> enter</dt>
        <dd>Open issue</dd>
      </dl>
    </div><!-- /.columns.last -->

  </div><!-- /.columns.equacols -->

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Issues</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selection down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selection up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>x</dt>
          <dd>Toggle selection</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open issue</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column middle">
        <dl class="keyboard-mappings">
          <dt>I</dt>
          <dd>Mark selection as read</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>U</dt>
          <dd>Mark selection as unread</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>e</dt>
          <dd>Close selection</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>y</dt>
          <dd>Remove selection from view</dd>
        </dl>
      </div><!-- /.column.middle -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>c</dt>
          <dd>Create issue</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Create label</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>i</dt>
          <dd>Back to inbox</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>u</dt>
          <dd>Back to issues</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>/</dt>
          <dd>Focus issues search</dd>
        </dl>
      </div>
    </div>
  </div>

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Issues Dashboard</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selection down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selection up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open issue</dd>
        </dl>
      </div><!-- /.column.first -->
    </div>
  </div>

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Network Graph</h3>
    <div class="columns equacols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt><span class="badmono">←</span> <em>or</em> h</dt>
          <dd>Scroll left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">→</span> <em>or</em> l</dt>
          <dd>Scroll right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↑</span> <em>or</em> k</dt>
          <dd>Scroll up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↓</span> <em>or</em> j</dt>
          <dd>Scroll down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Toggle visibility of head labels</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">←</span> <em>or</em> shift h</dt>
          <dd>Scroll all the way left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">→</span> <em>or</em> shift l</dt>
          <dd>Scroll all the way right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↑</span> <em>or</em> shift k</dt>
          <dd>Scroll all the way up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↓</span> <em>or</em> shift j</dt>
          <dd>Scroll all the way down</dd>
        </dl>
      </div><!-- /.column.last -->
    </div>
  </div>

  <div >
    <div class="rule"></div>
    <div class="columns threecols">
      <div class="column first" >
        <h3>Source Code Browsing</h3>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Activates the file finder</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Jump to line</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>w</dt>
          <dd>Switch branch/tag</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>y</dt>
          <dd>Expand URL to its canonical form</dd>
        </dl>
      </div>
    </div>
  </div>
</div>

    <div id="markdown-help" class="instapaper_ignore readability-extra">
  <h2>Markdown Cheat Sheet</h2>

  <div class="cheatsheet-content">

  <div class="mod">
    <div class="col">
      <h3>Format Text</h3>
      <p>Headers</p>
      <pre>
# This is an &lt;h1&gt; tag
## This is an &lt;h2&gt; tag
###### This is an &lt;h6&gt; tag</pre>
     <p>Text styles</p>
     <pre>
*This text will be italic*
_This will also be italic_
**This text will be bold**
__This will also be bold__

*You **can** combine them*
</pre>
    </div>
    <div class="col">
      <h3>Lists</h3>
      <p>Unordered</p>
      <pre>
* Item 1
* Item 2
  * Item 2a
  * Item 2b</pre>
     <p>Ordered</p>
     <pre>
1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b</pre>
    </div>
    <div class="col">
      <h3>Miscellaneous</h3>
      <p>Images</p>
      <pre>
![GitHub Logo](/images/logo.png)
Format: ![Alt Text](url)
</pre>
     <p>Links</p>
     <pre>
http://github.com - automatic!
[GitHub](http://github.com)</pre>
<p>Blockquotes</p>
     <pre>
As Kanye West said:

> We're living the future so
> the present is our past.
</pre>
    </div>
  </div>
  <div class="rule"></div>

  <h3>Code Examples in Markdown</h3>
  <div class="col">
      <p>Syntax highlighting with <a href="http://github.github.com/github-flavored-markdown/" title="GitHub Flavored Markdown" target="_blank">GFM</a></p>
      <pre>
```javascript
function fancyAlert(arg) {
  if(arg) {
    $.facebox({div:'#foo'})
  }
}
```</pre>
    </div>
    <div class="col">
      <p>Or, indent your code 4 spaces</p>
      <pre>
Here is a Python code example
without syntax highlighting:

    def foo:
      if not bar:
        return true</pre>
    </div>
    <div class="col">
      <p>Inline code for comments</p>
      <pre>
I think you should use an
`&lt;addr&gt;` element here instead.</pre>
    </div>
  </div>

  </div>
</div>


    <div class="ajax-error-message">
      <p><span class="icon"></span> Something went wrong with that request. Please try again. <a href="javascript:;" class="ajax-error-dismiss">Dismiss</a></p>
    </div>

    
    
    
    <span id='server_response_time' data-time='0.17994' data-host='fe6'></span>
  </body>
</html>

