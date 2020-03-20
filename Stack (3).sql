-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 20, 2020 at 12:50 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Stack`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `parent_answer_id` int(11) DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `user_id`, `question_id`, `parent_answer_id`, `answer`, `created_at`, `updated_at`) VALUES
(8, 8, 15, NULL, '<p>this is an answer</p>', '2020-01-07 00:09:11', '2020-01-07 00:09:11'),
(9, 8, 15, NULL, '<p>bis is another answr</p>', '2020-01-07 00:47:31', '2020-01-07 00:47:31'),
(10, 8, 15, NULL, '<p>This is one more answer</p>', '2020-01-07 00:49:16', '2020-01-07 00:49:16'),
(17, 16, 16, NULL, '<p>Just use vuelidate plugin from npm website</p>', '2020-01-07 05:05:07', '2020-01-07 05:05:07'),
(18, 17, 16, NULL, '<p>2 conditions are conflicted here.</p>\n<p>use it like:-</p>\n<pre class=\"language-markup\"><code> &lt;div class=\"form-group\"&gt;\n                    &lt;input type=\"text\" id=\"name\" class=\"form-control\" placeholder=\"Name\" name=\"name\" v-model.trim=\"$v.user.name.$model\"  :class=\"{\'is-invalid\' :$v.user.name.$error, \'is-valid\' :!$v.user.name.$invalid}\" /&gt;\n                        &lt;div class=\"invalid-feedback\"&gt;\n                        &lt;span v-if=\"!$v.user.name.required\"&gt;&lt;sup&gt;*&lt;/sup&gt;Name is required.&lt;/span&gt;\n                        &lt;/div&gt;\n                &lt;/div&gt;</code></pre>', '2020-01-07 05:06:12', '2020-01-07 05:06:12'),
(19, 8, 15, NULL, '<p>Testing data</p>', '2020-01-19 23:15:37', '2020-01-19 23:15:37'),
(20, 21, 20, NULL, '<p>Hello this is my answer.</p>', '2020-01-20 23:11:17', '2020-01-20 23:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_16_044958_create_tag_table', 1),
(5, '2019_12_16_045128_create_question_table', 1),
(6, '2019_12_16_045137_create_answer_table', 1),
(7, '2019_12_16_061345_create_posttag_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posttag`
--

CREATE TABLE `posttag` (
  `question_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `answer_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `title`, `tags`, `question`, `views`, `answer_count`, `created_at`, `updated_at`) VALUES
(15, 8, 'Firebase Dynamic Links is not working for iOS in a react-native-js', '4, 1, 5', '<p>&nbsp;</p>\n<p>I have setup Passwordless authentication for my react-native app, for that it required to setup firebase dynamic links which I did successfully.</p>\n<p>And everything was working fine on both Platforms Android and iOS, but after I merged my branch with the master, it stopped working on iOS. Meaning I am receiving the email to SignIn but that link is not opening the iOS app but it is working on Android successfully.</p>\n<p>I did the following steps to setup Dynamic Links for iOS:</p>\n<ol>\n<li>AppDelegate.m\n<pre class=\"language-java\"><code>#import \"AppDelegate.h\"\n\n#import &lt;React/RCTBridge.h&gt;\n#import &lt;React/RCTBundleURLProvider.h&gt;\n#import &lt;React/RCTRootView.h&gt;\n@import Firebase;\n//Deep Linking RNavigation Docs\n#import &lt;React/RCTLinkingManager.h&gt;\n//Deep Linking RNavigation Docs\n\n@implementation AppDelegate\n\n- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions\n{\n RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];\n RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge\n                                                  moduleName:@\"realyze\"\n                                           initialProperties:nil];\n\n rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];\n\n self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];\n UIViewController *rootViewController = [UIViewController new];\n rootViewController.view = rootView;\n self.window.rootViewController = rootViewController;\n [self.window makeKeyAndVisible];\n [FIRApp configure];\n return YES;\n}\n\n- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge\n{\n#if DEBUG\n return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@\"index\" fallbackResource:nil];\n#else\n return [[NSBundle mainBundle] URLForResource:@\"main\" withExtension:@\"jsbundle\"];\n#endif\n}\n//Deep Linking RNavigation Docs\n- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url\n           options:(NSDictionary&lt;UIApplicationOpenURLOptionsKey,id&gt; *)options\n{\n return [RCTLinkingManager application:app openURL:url options:options];\n}\n//Deep Linking RNavigation Docs\n\n@end\n​</code></pre>\n</li>\n<li>\n<p>Added Association Domains Capability In Xcode and in my Apple Developer Account for the particular App</p>\n</li>\n<li>\n<p>Added TeamID to Firebase Console for the appID prefix.</p>\n</li>\n<li>\n<p>Added these Firebase Authorized Domains: applinks:realyze.page.link activitycontinuation:realyze.page.link</p>\n</li>\n<li>\n<p>Also added domains to an entitlements file</p>\n</li>\n<li>app-site-associations-file is also setup correctly</li>\n</ol>\n<p>This setup worked for me before I merged my branch.</p>\n<p>Help would be very much appreciated.</p>\n<p>Thank you.</p>', 56, 4, '2020-01-06 00:21:58', '2020-01-26 23:25:20'),
(16, 8, 'validation 2', '2', '<p>how to implement validation in <strong>vue.js</strong> ?</p>\n<p>&nbsp;</p>\n<pre class=\"language-markup\"><code>&lt;div class=\"form-group\"&gt;\n                    &lt;input type=\"text\" id=\"name\" class=\"form-control\" placeholder=\"Name\" name=\"name\" v-model.trim=\"$v.user.name.$model\"  :class=\"{\'is-invalid\' :$v.user.name.$error || is-invalid\' :$v.user.name.$error , \'is-valid\' :!$v.user.name.$invalid}\" /&gt;\n                        &lt;div class=\"invalid-feedback\"&gt;\n                        &lt;span v-if=\"!$v.user.name.required\"&gt;&lt;sup&gt;*&lt;/sup&gt;Name is required.&lt;/span&gt;\n                        &lt;/div&gt;\n                &lt;/div</code></pre>', 18, 2, '2020-01-07 05:03:26', '2020-01-24 05:17:49'),
(20, 8, 'Plotting exponential with mean', '12, 3', '<p>I\'m working on a validation script where I\'m parsing out some distributions from source code and wanting to create plots. So far most of it is working, but I can\'t figure out how I\'m supposed to supply the mean.</p>\n<blockquote>\n<p>In java we use&nbsp;<code>org.apache.commons.math3.distribution.ExponentialDistribution</code>&nbsp;which takes a mean so we use it like this&nbsp;<code>new ExponentialDistribution(m)</code></p>\n</blockquote>\n<p>\'m using&nbsp;<code>matplotlib.pyplot</code>&nbsp;for plotting and&nbsp;<code>numpy</code>&nbsp;+&nbsp;<code>scikit.stats</code> for the data. But looking at&nbsp; <a title=\"link to my question\" href=\"https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.expon.html#scipy.stats.expon\" target=\"_blank\" rel=\"noopener\">link</a> I&nbsp; &nbsp;can\'t figure out how to supply the mean variable I parse from the code.</p>\n<p>In short, if I parse out&nbsp;<code>new ExponentialDistrubution(5)</code>...how do I plot that?</p>\n<p>If I remove all the parsing code and other irrelevant stuff my code does this:</p>\n<pre class=\"language-python\"><code>import numpy as np\nimport scipy.stats as stats\nimport matplotlib.pyplot as plt\n\nxvalues = np.linspace(stats.expon.ppf(0.01), stats.expon.ppf(0.99), 100)\ncdf = stats.expon.cdf(xvalues)\nplt.plot(xvalues, cdf)\nplt.savefig(\"graph.png\")</code></pre>\n<p><code></code></p>', 18, 1, '2020-01-10 01:43:44', '2020-01-21 04:01:56'),
(21, 20, 'Vuejs 2 + form validation', '6, 7', '<div class=\"post-text\">\n<p>Since vue-validator&nbsp;<a href=\"https://github.com/vuejs/vue-validator\" rel=\"noreferrer\">https://github.com/vuejs/vue-validator</a>&nbsp;is being ready for Vuejs 2, what is the best way to implement frontend validation?</p>\n<p>UPDATE I\'ve found this awesome plugin&nbsp;<a href=\"http://vee-validate.logaretm.com/\" rel=\"noreferrer\">Vee Validate</a></p>\n</div>\n<blockquote>\n<div class=\"post-taglist grid gs4 gsy fd-column\">This question is&nbsp;<a href=\"https://stackoverflow.com/help/closed-questions\">off-topic</a>. It is not currently accepting answers.</div>\n</blockquote>', 7, 0, '2020-01-10 03:52:52', '2020-01-27 00:07:40'),
(22, 8, 'fdbdfbdf', '1', '<p>dfbdfbf</p>', 0, 0, '2020-01-23 23:39:38', '2020-01-23 23:39:38'),
(23, 8, 'cghkgh', '1', '<p>ghjkghj</p>', 0, 0, '2020-01-24 00:52:33', '2020-01-24 00:52:33'),
(26, 8, 'how to create nested json by mapping values to class in pyhton (querying postgres) Ask', '12, 12', '<pre class=\"language-python\"><code>from sqlalchemy.ext.declarative import declarative_base\nfrom sqlalchemy import Column, Integer, String, Float\n\nBase = declarative_base()\n\nclass Report(Base):\n    __tablename__ = \'report\'\n\n    id = Column(Integer, primary_key=True)\n    a=Column(\'a\',String)\n    b=Column(\'b\',Integer)\n    c= Column(\'c\', Integer)\n    data=ChildClass(b,c)\n\n    def __init__(self, o,new_data):\n        self.a = o\n        self.data=new_data;\n\nclass ChildClass(object):\n\n    def __init__(self,bdata,cdata):\n       self.b=bdata\n       self.c=cdata</code></pre>', 1, 0, '2020-01-24 05:16:08', '2020-01-26 23:27:10');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `used`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Java', 0, 'Java (not to be confused with JavaScript, JScript or JS) is a general-purpose, platform-independent, statically typed, object-oriented programming language designed to be used in conjunction with the Java Virtual Machine (JVM). \"Java platform\" is the name for a computing system that has installed tools for developing and running Java programs. Use this tag for questions referring to the Java programming language or Java platform tools.', '2019-07-15 18:30:00', '2020-01-26 23:29:11'),
(2, 'javascript', 0, 'JavaScript (not to be confused with Java) is a high-level, dynamic, multi-paradigm, object-oriented, prototype-based, weakly-typed, and interpreted language used for both client-side and server-side scripting. Its primary use is in the rendering and manipulation of web pages. Use this tag for questions regarding ECMAScript and its various dialects/implementations (excluding ActionScript and Google-Apps-Script).', '2019-07-15 18:30:00', '2019-09-12 11:37:21'),
(3, 'swift', 0, 'Swift is a general-purpose, open-source programming language developed by Apple Inc. for its platforms and Linux. Use the tag only for questions about language features, or requiring code in Swift. Use the tags [ios], [ipados], [macos], [watch-os], [tvos], [cocoa-touch], and [cocoa] for (language-agnostic) questions about the platforms or frameworks.', '2019-07-15 18:30:00', '2019-09-12 11:37:21'),
(4, 'css', 0, 'CSS (Cascading Style Sheets) is a representation style sheet language used for describing the look and formatting of HTML (HyperText Markup Language), XML (Extensible Markup Language) documents and SVG elements including (but not limited to) colours, layout, fonts, and animations. It also describes how elements should be rendered on screen, on paper, in speech, or on other media.', '2019-07-15 18:30:00', '2019-09-12 11:37:21'),
(5, 'angular', 0, 'Questions about Angular (not to be confused with AngularJS), the web framework from Google. Use this tag for Angular questions which are not specific to an individual version. For the older AngularJS (1.x) web framework, use the angularjs tag.', '2019-07-15 18:30:00', '2020-01-24 00:23:51'),
(6, 'vue', 0, 'Vue.js is an open-source, progressive Javascript framework for building user interfaces that aim to be incrementally adoptable. Vue.js is mainly used for front-end development and requires an intermediate level of HTML and CSS. Vue.js version specific questions should be tagged with [vuejs2] or [vuejs3].', '2019-07-15 18:30:00', '2019-09-12 11:37:21'),
(7, 'laravel', 0, 'Laravel is a free, open-source PHP web framework, created by Taylor Otwell and intended for the development of web applications following the model–view–controller (MVC) architectural pattern and based on Symfony. The source code of Laravel is hosted on GitHub and licensed under the terms of MIT License.', '2019-07-15 18:30:00', '2019-09-12 11:37:21'),
(8, 'react', 0, 'React (also known as React.js or ReactJS) is a JavaScript library for building user interfaces. It uses a declarative paradigm and aims to be both efficient and flexible.', '2019-07-15 18:30:00', '2019-09-12 11:37:21'),
(9, 'arrays', 0, 'An java-array is an ordered data structure consisting of a collection of elements (values, variables or references), each identified by one or more indexes. When asking about specific variants of arrays, use these related tags instead: [vector], [arraylist], [matrix]. When using this tag, in a question which is specific to a programming language, tag the question with the programming language being used.', '2019-07-15 18:30:00', '2019-09-12 11:37:21'),
(10, 'performance', 0, 'For javascript questions pertaining to the measurement or improvement of code and application efficiency.\r\n', '2019-07-15 18:30:00', '2019-09-12 11:37:21'),
(12, 'python', 0, 'new tag', '2020-01-10 01:43:44', '2020-01-10 01:43:44'),
(13, 'Python', 0, 'Whether you\'re new to programming or an experienced developer, it\'s easy to learn and use Python.', '2020-01-10 03:17:13', '2020-01-10 03:17:13'),
(18, 'Machine Learning', 0, 'Machine learning is the scientific study of algorithms and statistical models that computer systems use to perform a specific task without using explicit instructions, relying on patterns and inference instead. It is seen as a subset of artificial intelligence.', '2020-01-26 23:29:51', '2020-01-26 23:29:51'),
(29, 'jhbn,mb n', 0, 'kjlh', '2020-01-26 23:57:44', '2020-01-26 23:57:44'),
(30, 'fddzbdfb', 0, 'fbnfgb', '2020-01-26 23:58:42', '2020-01-26 23:58:42'),
(33, 'fgnbfgnfgn', 0, 'dfngbg', '2020-01-27 00:02:27', '2020-01-27 00:02:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@test.com', '$2y$10$I3ap2PfJDyPTffsrcLqKbeiqrZSnr6Z6mj1vILqwdQNAdVj.l1d7q', 2, '2019-12-16 03:11:30', '2019-12-16 03:11:30'),
(2, 'User', 'user@test.com', '$2y$10$53eNSWEWikYMInQavC0/L.4.LSV1yCPWDknsRmhQ1L4P7Cwfw2RWu', 1, '2019-12-16 03:11:30', '2020-01-26 23:32:53'),
(8, 'shubhangi', 'me@gmail.com', '$2y$10$lVkjxZ4VEUa8wcELp1lEruKp8Ns9Wak2n3NCIMKD/Zf1SfpuBpW4u', 1, '2019-12-25 23:35:48', '2020-01-24 01:38:36'),
(16, 'Niranjan', 'niranjan@gmail.com', '$2y$10$EWtyT0VTr7fj7LH2A9Lrxez8S7MZtUYBUL3LvK.dOWTr.RVoO.vUq', 1, '2020-01-07 05:04:28', '2020-01-07 05:04:28'),
(17, 'Ctal', 'ctal@gmail.com', '$2y$10$/7oPIR.yxi/WExVxQudMOeBaSHbkxRVv/7tHKKV51qEijM3V9QbM6', 1, '2020-01-07 05:04:43', '2020-01-07 05:04:43'),
(20, 'Ghost', 'coder@gmail.com', '$2y$10$GQZVQalkBLSI8BgX.8hg/ezdBT.a3EKecb03PzjzTa1gQJGWe2GWK', 1, '2020-01-10 03:50:57', '2020-01-20 04:03:27'),
(21, 'Sohan', 'sohan@ranosys.com', '$2y$10$1xoq2NewQjjY35Bw1u5zXOQ8HYrCpjhYubZpyOXe7UCDF0kYFBd6m', 1, '2020-01-20 23:09:13', '2020-01-20 23:09:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer_user_id_foreign` (`user_id`),
  ADD KEY `answer_question_id_foreign` (`question_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posttag`
--
ALTER TABLE `posttag`
  ADD KEY `posttag_question_id_foreign` (`question_id`),
  ADD KEY `posttag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_user_id_foreign` (`user_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answer_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `answer_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posttag`
--
ALTER TABLE `posttag`
  ADD CONSTRAINT `posttag_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `posttag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `question_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
