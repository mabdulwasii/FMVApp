
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/'
grails.plugin.springsecurity.successHandler.alwaysUseDefault = false
grails.plugin.springsecurity.successHandler.useReferer = true
grails.plugin.springsecurity.securityConfigType = "Annotation"


// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.nvrd.security.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.nvrd.security.UserRole'
grails.plugin.springsecurity.authority.className = 'com.nvrd.security.Role'

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/**/dbconsole', access: ['ROLE_ADMIN']],
	[pattern: '/**/dbconsole/**', access: ['ROLE_ADMIN']],
	[pattern: '/**/a/**', access: ['ROLE_ADMIN']],
	[pattern: '/**/role/**', access: ['ROLE_ADMIN']],
	[pattern: '/**/securityInfo/**', access: ['ROLE_ADMIN']],
	[pattern: '/**/registrationCode/**', access: ['ROLE_ADMIN']],
	[pattern: '/**/securityInfo/**', access: ['ROLE_ADMIN']],
	[pattern: '/**/role/**', access: ['ROLE_ADMIN']],
	[pattern: '/**/signin/**', access: ['permitAll']],
	[pattern: '/**/about/**', access: ['permitAll']],
	[pattern: '/**/faq/**', access: ['permitAll']],
	[pattern: '/**/contact/**', access: ['permitAll']],
	[pattern: '/**/loginOTPEmail/**', access: ['permitAll']],
	[pattern: '/**/loginOTPPhone/**', access: ['permitAll']],
	[pattern: '/**/search/**', access: ['permitAll']],
	[pattern: '/register', access: ['permitAll']],
	[pattern: '/**/register/index', access: ['permitAll']],
	[pattern: '/**/register/**', access: ['permitAll']],
	[pattern: '/vehicle/**', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.png', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

//SMS
//infobip.host = "https://api.infobip.com/sms/1"
//+13343262450
