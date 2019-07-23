<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<head>
<title>首页</title>
<style type="text/css">
.well {
	min-height: 20px;
	padding: 19px;
	margin-bottom: 20px;
	background-color: #f5f5f5;
	border: 1px solid #e3e3e3;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
}

.rating {
	unicode-bidi: bidi-override;
	direction: rtl;
	font-size: 30px;
}

.rating span.star {
	font-family: FontAwesome;
	font-weight: normal;
	font-style: normal;
	display: inline-block;
}

.rating span.star:hover {
	cursor: pointer;
}

.rating span.star:before {
	content: "\f006";
	padding-right: 5px;
	color: #777777;
}

.rating span.star:hover:before, .rating span.star:hover ~ span.star:before
	{
	content: "\f005";
	color: #e3cf7a;
}
</style>
</head>
<body>

		<div class="page-bar">
			<ul class="page-breadcrumb">
				<li><i class="fa fa-home"></i> <a
						href="${dynamicServer}/index.htm">首页</a></li>
				<li>>示例代码</li>
				<li>>FontAwesome示例</li>
			</ul>
		</div>

		<div class="row">
			<div class="col-md-12" >
				<div class="portlet light">
					<div class="portlet-body">

						<h2>
							1、简单介绍
						</h2>
                        <div class="row">
						<div class="col-md-12">Font
							Awesome为您提供可缩放的矢量图标，您可以使用CSS所提供的所有特性对它们进行更改，包括：大小、颜色、阴影或者其它任何支持的效果。
						</div>
                        <div class="col-md-4 col-sm-6">
                            <h4>
                                <i class="fa fa-flag"></i> 一个字库，675个图标
                            </h4>
                            仅一个Font Awesome字库，就包含了与网页相关的所有形象图标。
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h4>
                                <i class="fa fa-ban"></i> 无需依赖JavaScript
                            </h4>
                            Font Awesome完全不依赖JavaScript，因此无需担心兼容性。
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h4>
                                <i class="fa fa-arrows-alt"></i> 无限缩放
                            </h4>
                            无论在任何尺寸下，可缩放的矢量图形都会为您呈现出完美的图标。
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h4>
                                <i class="fa fa-microphone"></i> 如言语一般自由
                            </h4>
                            Font Awesome完全免费，哪怕是商业用途。请查看<a href="#license">许可</a>。
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h4>
                                <i class="fa fa-pencil"></i> CSS控制
                            </h4>
                            只要CSS支持，无论颜色、大小、阴影或者其它任何效果，都可以轻易展现。
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h4>
                                <i class="fa fa-eye"></i> 高分屏完美呈现
                            </h4>
                            Font Awesome的矢量图标，将使您的网站在视网膜级的高分屏上大放异彩。
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h4>
                                <i class="fa fa-gamepad"></i> 完美兼容其它框架
                            </h4>
                            尽管是为<a href="http://getbootstrap.com">Bootstrap</a>设计，但Font
                            Awesome同样能与其它框架完美协同运作。
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h4>
                                <i class="fa fa-desktop"></i> 可用于桌面系统
                            </h4>
                            用于桌面系统，或需要一套完整的矢量图，请查看<a
                                href="http://fontawesome.io/cheatsheet/" target="_blank">备忘</a>。
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h4>
                                <i class="fa fa-search"></i> 可适配于屏幕阅读器
                            </h4>
                            与其它字体不同，Font Awesome不会影响屏幕阅读器正常工作。
                        </div>
                        </div>
					</div>
		         </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
			    <div class="portlet light">
                     <div class="portlet-body">
                        <h2>2、使用介绍</h2>
                         <div class="row">
                            <div class="col-md-12">
                                <h2 >
                                    最简单的方式：<a href="http://www.bootstrapcdn.com/#fontawesome_tab"
                                              target="_blank">BootstrapCDN</a> （由<a
                                        href="http://maxcdn.com">MaxCDN</a>提供）
                                </h2>

                                <p>一句话将Font Awesome加入您的网页中。您完全不用下载或者安装任何东西！</p>
                                <ol>
                                    <li>
                                        将以下代码粘贴到网页HTML代码的 <code>&lt;head&gt;</code> 部分.
                                        <div class="highlight"><pre><code class="html"><span class="nt">&lt;link</span> <span class="na">href=</span><span class="s">"//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"</span> <span class="na">rel=</span><span class="s">"stylesheet"</span><span class="nt">&gt;</span>
                                          </code></pre></div>
                                        <p class="alert alert-success"><i class="fa fa-info-circle"></i> 当新版本发布时，BootstrapCDN需要一点时间来同步到最新版本。稍安勿躁 :)</p>
                                    </li>
                                    <li>
                                        参考<a href="#basic">示例</a>，然后开始使用Font Awesome吧!
                                    </li>
                                </ol>
                            </div>
                            <div class="col-md-12">
                                <section id="default-css">
                                    <h2 >简单方式之一：使用默认CSS</h2>
                                    <p>如果您使用了默认的Bootstrap CSS样式，那么你可以使用这种方式来引入默认的Font Awesome
                                        CSS样式。</p>
                                    <ol>
                                        <li>复制整个 <code>font-awesome</code> 文件夹到您的项目中。</li>
                                        <li>
                                            在HTML的 <code>&lt;head&gt;</code> 中引用font-awesome.min.css。
                                            <div class="highlight"><pre><code class="html"><span class="nt">&lt;link</span> <span class="na">rel=</span><span class="s">"stylesheet"</span> <span class="na">href=</span><span class="s">"path/to/font-awesome/css/font-awesome.min.css"</span><span class="nt">&gt;</span>
                                                       </code></pre>
                                            </div>
                                        </li>
                                        <li>参考<a href="#basic">示例</a>，然后开始使用Font Awesome吧!
                                        </li>
                                    </ol>
                                </section>
                            </div>
                            <div class="col-md-12">
                                <section class="need-ie7">
                                    <h2 >需要支持IE7？</h2>
                                    <p>
                                        如果需要支持IE7，那真的十分抱歉。Font Awesome从4.1.0版本开始不再支持IE7，
                                        但更早的版本仍然支持。您可以查看 <a
                                            href="http://fontawesome.io/3.2.1/get-started/#need-ie7">3.2.1
                                        的IE7支持说明</a>。

                                    </p>
                                </section>
                            </div>
                         </div>
                     </div>
                 </div>
            </div>
        </div>

        <div class="row">
                <div class="col-md-12" >
                    <div class="portlet light">
                        <div class="portlet-body">
                            <div class="col-md-12">
                                <h2 >3、基本图标</h2>
                                <div class="col-md-3 col-sm-4">
                                    <p>
                                        <i class="fa fa-camera-retro"></i> fa-camera-retro
                                    </p>
                                </div>
                                <div class="col-md-7 col-sm-8">
                                    <p>
                                        您可以将Font Awesome图标使用在几乎任何地方，只需要使用CSS前缀
                                        <code>fa</code>
                                        ，再加上图标名称。 Font Awesome是为使用内联元素而设计的。我们通常更喜欢使用
                                        <code>&lt;i&gt;</code>
                                        ，因为它更简洁。 但实际上使用
                                        <code>&lt;span&gt;</code>
                                        才能更加语义化。
                                    </p>
                                    <div class="highlight"><pre><code class="html"><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-camera-retro"</span><span class="nt">&gt;&lt;/i&gt;</span> fa-camera-retro
                                      </code></pre>
                                    </div>
                                    <div class="alert alert-success">
                                        <ul class="fa-ul">
                                            <li>
                                                <i class="fa fa-info-circle fa-lg fa-li"></i>
                                                如果您修改了图标容器的字体大小，图标大小会随之改变。同样的变化也会发生在颜色、阴影等其它任何CSS支持的效果上。
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2 >大图标</h2>
                                    <div class="col-md-3 col-sm-4">
                                        <p>
                                            <i class="fa fa-camera-retro fa-lg"></i> fa-lg
                                        </p>
                                        <p>
                                            <i class="fa fa-camera-retro fa-2x"></i> fa-2x
                                        </p>
                                        <p>
                                            <i class="fa fa-camera-retro fa-3x"></i> fa-3x
                                        </p>
                                        <p>
                                            <i class="fa fa-camera-retro fa-4x"></i> fa-4x
                                        </p>
                                        <p>
                                            <i class="fa fa-camera-retro fa-5x"></i> fa-5x
                                        </p>
                                    </div>
                                    <div class="col-md-9 col-sm-8">
                                        <p>
                                            使用
                                            <code>fa-lg</code>
                                            (33%递增)、
                                            <code>fa-2x</code>
                                            、
                                            <code>fa-3x</code>
                                            、
                                            <code>fa-4x</code>
                                            ，或者
                                            <code>fa-5x</code>
                                            类 来放大图标。
                                        </p>
                                        <div class="highlight">
								                <pre><code class="html"><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-camera-retro fa-lg"</span><span class="nt">&gt;&lt;/i&gt;</span> fa-lg<br/><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-camera-retro fa-2x"</span><span class="nt">&gt;&lt;/i&gt;</span> fa-2x<br/><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-camera-retro fa-3x"</span><span class="nt">&gt;&lt;/i&gt;</span> fa-3x<br/><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-camera-retro fa-4x"</span><span class="nt">&gt;&lt;/i&gt;</span> fa-4x<br/><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-camera-retro fa-5x"</span><span class="nt">&gt;&lt;/i&gt;</span> fa-5x</code>
								                </pre>
                                        </div>
                                        <div class="alert alert-success">
                                            <ul class="fa-ul">
                                                <li><i class="fa fa-exclamation-triangle fa-li fa-lg"></i>
                                                    如果图标的底部和顶部被截断了，您需要增加行高来解决此问题。</li>
                                            </ul>
                                        </div>
                                    </div>
                            </div>
                            <div class="col-md-12">
                                <h2 >固定宽度</h2>
                                <div class="row">
                                    <div class="col-md-3 col-sm-4">
                                        <div class="list-group">
                                            <a class="list-group-item" href="javascript:;"><i
                                                    class="fa fa-home fa-fw"></i>&nbsp; Home</a> <a
                                                class="list-group-item" href="javascript:;"><i
                                                class="fa fa-book fa-fw"></i>&nbsp; Library</a> <a
                                                class="list-group-item" href="javascript:;"><i
                                                class="fa fa-pencil fa-fw"></i>&nbsp; Applications</a> <a
                                                class="list-group-item" href="javascript:;"><i
                                                class="fa fa-cog fa-fw"></i>&nbsp; Settings</a>
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-8">
                                        <p>
                                            使用
                                            <code>fa-fw</code>
                                            可以将图标设置为一个固定宽度。主要用于不同宽度图标无法对齐的情况。 尤其在列表或导航时起到重要作用。
                                        </p>
                                        <div class="highlight">
                                                    <pre><code class="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"list-group"</span><span class="nt">&gt;</span><br/>&nbsp;&nbsp;<span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"list-group-item"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-home fa-fw"</span><span class="nt">&gt;&lt;/i&gt;</span><span class="ni">&amp;nbsp;</span> Home<span class="nt">&lt;/a&gt;</span><br/>&nbsp;&nbsp;<span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"list-group-item"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-book fa-fw"</span><span class="nt">&gt;&lt;/i&gt;</span><span class="ni">&amp;nbsp;</span> Library<span class="nt">&lt;/a&gt;</span><br/>&nbsp;&nbsp;<span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"list-group-item"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-pencil fa-fw"</span><span class="nt">&gt;&lt;/i&gt;</span><span class="ni">&amp;nbsp;</span> Applications<span class="nt">&lt;/a&gt;</span><br/>&nbsp;&nbsp;<span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"list-group-item"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-cog fa-fw"</span><span class="nt">&gt;&lt;/i&gt;</span><span class="ni">&amp;nbsp;</span> Settings<span class="nt">&lt;/a&gt;</span><br/><span class="nt">&lt;/div&gt;</span></code>
                                                    </pre>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2 >用于列表</h2>
                                <div class="row">
                                <div class="col-md-3 col-sm-4">
                                    <ul class="fa-ul">
                                        <li><i class="fa-li fa fa-check-square"></i>List icons</li>
                                        <li><i class="fa-li fa fa-check-square"></i>can be used</li>
                                        <li><i class="fa-li fa fa-spinner fa-spin"></i>as
                                            bullets</li>
                                        <li><i class="fa-li fa fa-square"></i>in lists</li>
                                    </ul>
                                </div>
                                <div class="col-md-9 col-sm-8">
                                    <p>
                                        使用
                                        <code>fa-ul</code>
                                        和
                                        <code>fa-li</code>
                                        便可以简单的将无序列表的默认符号替换掉。
                                    </p>
                                    <div class="highlight"><pre><code class="html"><span class="nt">&lt;ul</span> <span class="na">class=</span><span class="s">"fa-ul"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;li&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa-li fa fa-check-square"</span><span class="nt">&gt;&lt;/i&gt;</span>List icons<span class="nt">&lt;/li&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;li&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa-li fa fa-check-square"</span><span class="nt">&gt;&lt;/i&gt;</span>can be used<span class="nt">&lt;/li&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;li&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa-li fa fa-spinner fa-spin"</span><span class="nt">&gt;&lt;/i&gt;</span>as bullets<span class="nt">&lt;/li&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;li&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa-li fa fa-square"</span><span class="nt">&gt;&lt;/i&gt;</span>in lists<span class="nt">&lt;/li&gt;</span><br /><span class="nt">&lt;/ul&gt;</span></code>
									            </pre>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="col-md-12">
                                <h2 class="page-header">边框与对齐</h2>
                                <div class="row">
                                    <div class="col-md-3 col-sm-4">
                                        <p>
                                            <i class="fa fa-quote-left fa-3x pull-left fa-border"></i>
                                            …tomorrow we will run faster, stretch out our arms farther…
                                            And then one fine morning— So we beat on, boats against the
                                            current, borne back ceaselessly into the past.
                                        </p>
                                    </div>
                                    <div class="col-md-9 col-sm-8">
                                        <p>
                                            使用
                                            <code>fa-border</code>
                                            以及
                                            <code>pull-right</code>
                                            或
                                            <code>pull-left</code>
                                            可以轻易构造出引用的特殊效果。
                                        </p>
                                        <div class="highlight"><pre><code class="html"><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-quote-left fa-3x pull-left fa-border"</span><span class="nt">&gt;&lt;/i&gt;</span><br />...tomorrow we will run faster, stretch out our arms farther...<br />And then one fine morning— So we beat on, boats against the<br />current, borne back ceaselessly into the past.
                                             </code></pre>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2 class="page-header">动画</h2>
                                <div class="row">
                                    <div class="col-md-3 ">
                                        <p>
                                            <i class="fa fa-spinner fa-spin fa-3x fa-fw margin-bottom"></i>
                                            <i
                                                    class="fa fa-circle-o-notch fa-spin fa-3x fa-fw margin-bottom"></i>
                                            <i class="fa fa-refresh fa-spin fa-3x fa-fw margin-bottom"></i>
                                            <i class="fa fa-cog fa-spin fa-3x fa-fw margin-bottom"></i><br/><br/>

                                            <i class="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom"></i>
                                        </p>
                                    </div>
                                    <div class="col-md-9 ">
                                        <p>
                                            使用
                                            <code>fa-spin</code>
                                            类来使任意图标旋转，现在您还可以使用
                                            <code>fa-pulse</code>
                                            来使其进行8方位旋转。尤其适合
                                            <code>fa-spinner</code>
                                            、
                                            <code>fa-refresh</code>
                                            和
                                            <code>fa-cog</code>
                                            。
                                        </p>
                                        <div class="highlight"><pre><code class="html"><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-spinner fa-spin"</span><span class="nt">&gt;&lt;/i&gt;</span>
                                            <span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-circle-o-notch fa-spin"</span><span class="nt">&gt;&lt;/i&gt;</span>
                                            <span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-refresh fa-spin"</span><span class="nt">&gt;&lt;/i&gt;</span>
                                            <span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-cog fa-spin"</span><span class="nt">&gt;&lt;/i&gt;</span>
                                            <span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-spinner fa-pulse"</span><span class="nt">&gt;&lt;/i&gt;</span>
                                            </code></pre>
                                        </div>
                                        <p class="alert alert-success">
                                            <i class="fa fa-info-circle"></i> CSS3动画不支持IE8-IE9。
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2 >旋转与翻转</h2>
                                <div class="row">
                                    <div class="col-md-3 col-sm-4">
                                        <p style="font-size: 18px;">
                                            <i class="fa fa-shield"></i>&nbsp; normal<br> <i
                                                class="fa fa-shield fa-rotate-90"></i>&nbsp; fa-rotate-90<br>
                                            <i class="fa fa-shield fa-rotate-180"></i>&nbsp;
                                            fa-rotate-180<br> <i class="fa fa-shield fa-rotate-270"></i>&nbsp;
                                            fa-rotate-270<br> <i
                                                class="fa fa-shield fa-flip-horizontal"></i>&nbsp;
                                            fa-flip-horizontal<br> <i
                                                class="fa fa-shield fa-flip-vertical"></i>&nbsp;
                                            fa-flip-vertical
                                        </p>
                                    </div>
                                    <div class="col-md-9 col-sm-8">
                                        <p>
                                            使用
                                            <code>fa-rotate-*</code>
                                            和
                                            <code>fa-flip-*</code>
                                            类可以对图标进行任意旋转和翻转。
                                        </p>
                                        <div class="highlight"><pre><code class="html"><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-shield"</span><span class="nt">&gt;&lt;/i&gt;</span> normal<span class="nt">&lt;br&gt;</span><br /><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-shield fa-rotate-90"</span><span class="nt">&gt;&lt;/i&gt;</span> fa-rotate-90<span class="nt">&lt;br&gt;</span><br /><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-shield fa-rotate-180"</span><span class="nt">&gt;&lt;/i&gt;</span> fa-rotate-180<span class="nt">&lt;br&gt;</span><br /><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-shield fa-rotate-270"</span><span class="nt">&gt;&lt;/i&gt;</span> fa-rotate-270<span class="nt">&lt;br&gt;</span><br /><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-shield fa-flip-horizontal"</span><span class="nt">&gt;&lt;/i&gt;</span> fa-flip-horizontal<span class="nt">&lt;br&gt;</span><br /><span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-shield fa-flip-vertical"</span><span class="nt">&gt;&lt;/i&gt;</span> icon-flip-vertical
                                          </code></pre>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2 class="page-header">组合使用</h2>
                                <div class="row">
                                    <div class="col-md-3 col-sm-4">
                                        <div class="margin-bottom">
												<span class="fa-stack fa-lg"> <i
                                                        class="fa fa-square-o fa-stack-2x"></i> <i
                                                        class="fa fa-twitter fa-stack-1x"></i>
												</span> fa-twitter on fa-square-o<br> <span
                                                class="fa-stack fa-lg"> <i
                                                class="fa fa-circle fa-stack-2x"></i> <i
                                                class="fa fa-flag fa-stack-1x fa-inverse"></i>
												</span> fa-flag on fa-circle<br> <span class="fa-stack fa-lg">
													<i class="fa fa-square fa-stack-2x"></i> <i
                                                class="fa fa-terminal fa-stack-1x fa-inverse"></i>
												</span> fa-terminal on fa-square<br> <span
                                                class="fa-stack fa-lg"> <i
                                                class="fa fa-camera fa-stack-1x"></i> <i
                                                class="fa fa-ban fa-stack-2x text-danger"></i>
												</span> fa-ban on fa-camera
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-8">
                                        <p>
                                            如果想要将多个图标组合起来，使用
                                            <code>fa-stack</code>
                                            类作为父容器，
                                            <code>fa-stack-1x</code>
                                            作为正常比例的图标，
                                            <code>fa-stack-2x</code>
                                            作为大一些的图标。还可以使用
                                            <code>fa-inverse</code>
                                            类来切换图标颜色。您可以在父容器中 通过添加 <a href="#larger">大图标</a> 类来控制整体大小。
                                        </p>
                                        <div class="highlight"><pre><code class="html"><span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"fa-stack fa-lg"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-square-o fa-stack-2x"</span><span class="nt">&gt;&lt;/i&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-twitter fa-stack-1x"</span><span class="nt">&gt;&lt;/i&gt;</span><br /><span class="nt">&lt;/span&gt;</span><br />fa-twitter on fa-square-o<span class="nt">&lt;br&gt;</span><br /><span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"fa-stack fa-lg"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-circle fa-stack-2x"</span><span class="nt">&gt;&lt;/i&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-flag fa-stack-1x fa-inverse"</span><span class="nt">&gt;&lt;/i&gt;</span><br /><span class="nt">&lt;/span&gt;</span><br />fa-flag on fa-circle<span class="nt">&lt;br&gt;</span><br /><span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"fa-stack fa-lg"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-square fa-stack-2x"</span><span class="nt">&gt;&lt;/i&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-terminal fa-stack-1x fa-inverse"</span><span class="nt">&gt;&lt;/i&gt;</span><br /><span class="nt">&lt;/span&gt;</span><br />fa-terminal on fa-square<span class="nt">&lt;br&gt;</span><br /><span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"fa-stack fa-lg"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-camera fa-stack-1x"</span><span class="nt">&gt;&lt;/i&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-ban fa-stack-2x text-danger"</span><span class="nt">&gt;&lt;/i&gt;</span><br /><span class="nt">&lt;/span&gt;</span><br />fa-ban on fa-camera
                                            </code></pre>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2 >Bootstrap 3 示例</h2>
                                <div class="row">
                                    <div class="col-md-3 col-sm-4">
                                        <p>
                                            <a class="btn btn-danger" href="javascript:;"> <i
                                                    class="fa fa-trash-o fa-lg"></i> Delete
                                            </a> <a class="btn btn-default btn-sm" href="javascript:;">
                                            <i class="fa fa-cog"></i> Settings
                                        </a>
                                        </p>
                                        <p>
                                            <a class="btn btn-lg btn-success" href="javascript:;"> <i
                                                    class="fa fa-flag fa-2x pull-left"></i> Font Awesome<br>Version
                                                4.7.0
                                            </a>
                                        </p>
                                        <div class="margin-bottom">
                                            <div class="btn-group">
                                                <a class="btn btn-default" href="javascript:;"><i
                                                        class="fa fa-align-left"></i></a> <a class="btn btn-default"
                                                                                             href="javascript:;"><i class="fa fa-align-center"></i></a>
                                                <a class="btn btn-default" href="javascript:;"><i
                                                        class="fa fa-align-right"></i></a> <a class="btn btn-default"
                                                                                              href="javascript:;"><i class="fa fa-align-justify"></i></a>
                                            </div>
                                        </div>
                                        <div class="margin-bottom">
                                            <div class="input-group margin-bottom-sm">
													<span class="input-group-addon"><i
                                                            class="fa fa-envelope-o fa-fw"></i></span> <input
                                                    class="form-control" type="text"
                                                    placeholder="Email address">
                                            </div>
                                            <div class="input-group">
													<span class="input-group-addon"><i
                                                            class="fa fa-key fa-fw"></i></span> <input class="form-control"
                                                                                                       type="password" placeholder="Password" autocomplete="off"
                                                                                                       style="cursor: auto; background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAASCAYAAABSO15qAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH3QsPDhss3LcOZQAAAU5JREFUOMvdkzFLA0EQhd/bO7iIYmklaCUopLAQA6KNaawt9BeIgnUwLHPJRchfEBR7CyGWgiDY2SlIQBT/gDaCoGDudiy8SLwkBiwz1c7y+GZ25i0wnFEqlSZFZKGdi8iiiOR7aU32QkR2c7ncPcljAARAkgckb8IwrGf1fg/oJ8lRAHkR2VDVmOQ8AKjqY1bMHgCGYXhFchnAg6omJGcBXEZRtNoXYK2dMsaMt1qtD9/3p40x5yS9tHICYF1Vn0mOxXH8Uq/Xb389wff9PQDbQRB0t/QNOiPZ1h4B2MoO0fxnYz8dOOcOVbWhqq8kJzzPa3RAXZIkawCenHMjJN/+GiIqlcoFgKKq3pEMAMwAuCa5VK1W3SAfbAIopum+cy5KzwXn3M5AI6XVYlVt1mq1U8/zTlS1CeC9j2+6o1wuz1lrVzpWXLDWTg3pz/0CQnd2Jos49xUAAAAASUVORK5CYII=); background-attachment: scroll; background-position: 100% 50%; background-repeat: no-repeat;">
                                            </div>
                                        </div>
                                        <div class="margin-bottom">
                                            <div class="btn-group open">
                                                <a class="btn btn-primary" href="javascript:;"><i
                                                        class="fa fa-user fa-fw"></i> User</a> <a
                                                    class="btn btn-primary dropdown-toggle"
                                                    data-toggle="dropdown" href="javascript:;"> <span
                                                    class="fa fa-caret-down"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a class="col-xs-11"><i
                                                            class="fa fa-pencil fa-fw"></i> Edit</a></li>
                                                    <li><a class="col-xs-11"><i
                                                            class="fa fa-trash-o fa-fw"></i> Delete</a></li>
                                                    <li><a class="col-xs-11"><i
                                                            class="fa fa-ban fa-fw"></i> Ban</a></li>
                                                    <li class="divider"></li>
                                                    <li><a class="col-xs-11"><i class="i"></i> Make
                                                        admin</a></li>
                                                </ul>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-9 col-sm-8">
                                        <p>Font Awesome 完全兼容 Bootstrap 的所有组件。</p>
                                        <div class="highlight"><pre><code class="html"><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-danger"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-trash-o fa-lg"</span><span class="nt">&gt;&lt;/i&gt;</span> Delete<span class="nt">&lt;/a&gt;</span><br /><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-default btn-sm"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-cog"</span><span class="nt">&gt;&lt;/i&gt;</span> Settings<span class="nt">&lt;/a&gt;</span><br /><br/><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-lg btn-success"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-flag fa-2x pull-left"</span><span class="nt">&gt;&lt;/i&gt;</span> Font Awesome<span class="nt">&lt;br&gt;</span>Version 4.7.0<span class="nt">&lt;/a&gt;</span><br /><br/><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"btn-group"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-default"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-align-left"</span><span class="nt">&gt;&lt;/i&gt;&lt;/a&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-default"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-align-center"</span><span class="nt">&gt;&lt;/i&gt;&lt;/a&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-default"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-align-right"</span><span class="nt">&gt;&lt;/i&gt;&lt;/a&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-default"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-align-justify"</span><span class="nt">&gt;&lt;/i&gt;&lt;/a&gt;</span><br /><span class="nt">&lt;/div&gt;</span><br /><br/><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"input-group margin-bottom-sm"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"input-group-addon"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-envelope-o fa-fw"</span><span class="nt">&gt;&lt;/i&gt;&lt;/span&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">placeholder=</span><span class="s">"Email address"</span><span class="nt">&gt;</span><br /><span class="nt">&lt;/div&gt;</span><br /><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"input-group"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"input-group-addon"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-key fa-fw"</span><span class="nt">&gt;&lt;/i&gt;&lt;/span&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">type=</span><span class="s">"password"</span> <span class="na">placeholder=</span><span class="s">"Password"</span><span class="nt">&gt;</span><br /><span class="nt">&lt;/div&gt;</span><br /><br/><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"btn-group open"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-primary"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-user fa-fw"</span><span class="nt">&gt;&lt;/i&gt;</span> User<span class="nt">&lt;/a&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-primary dropdown-toggle"</span> <span class="na">data-toggle=</span><span class="s">"dropdown"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"fa fa-caret-down"</span><span class="nt">&gt;&lt;/span&gt;&lt;/a&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;ul</span> <span class="na">class=</span><span class="s">"dropdown-menu"</span><span class="nt">&gt;</span><br />&nbsp;&nbsp;&nbsp;&nbsp;<span class="nt">&lt;li&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-pencil fa-fw"</span><span class="nt">&gt;&lt;/i&gt;</span> Edit<span class="nt">&lt;/a&gt;&lt;/li&gt;</span><br />&nbsp;&nbsp;&nbsp;&nbsp;<span class="nt">&lt;li&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-trash-o fa-fw"</span><span class="nt">&gt;&lt;/i&gt;</span> Delete<span class="nt">&lt;/a&gt;&lt;/li&gt;</span><br />&nbsp;&nbsp;&nbsp;&nbsp;<span class="nt">&lt;li&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"fa fa-ban fa-fw"</span><span class="nt">&gt;&lt;/i&gt;</span> Ban<span class="nt">&lt;/a&gt;&lt;/li&gt;</span><br />&nbsp;&nbsp;&nbsp;&nbsp;<span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"divider"</span><span class="nt">&gt;&lt;/li&gt;</span><br />&nbsp;&nbsp;&nbsp;&nbsp;<span class="nt">&lt;li&gt;&lt;a</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;&lt;i</span> <span class="na">class=</span><span class="s">"i"</span><span class="nt">&gt;&lt;/i&gt;</span> Make admin<span class="nt">&lt;/a&gt;&lt;/li&gt;</span><br />&nbsp;&nbsp;<span class="nt">&lt;/ul&gt;</span><br /><span class="nt">&lt;/div&gt;</span>
                                             </code></pre>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2 >自定义CSS</h2>
                                <div class="row">
                                    <div class="col-md-4 col-sm-4">
                                        <p>您可以任意自定义修改 Font Awesome 的CSS样式表来实现您想要的效果。</p>
                                        <p>
                                            点击按钮展示css<br /><br/>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="javascript:showIcon2()">
                                                <i class="fa  fa-hand-o-up" /></i> 展示
                                            </button>
                                        </p>
                                    </div>
                                    <div class="col-md-5 col-sm-8">
                                        <p>
                                            星级评定（受 <a href="http://css-tricks.com/star-ratings/"
                                                      target="_blank">CSS Tricks</a> 所启发）
                                        </p>
                                        <div class="well">
												<span class="rating"> <span class="star"></span> <span
                                                        class="star"></span> <span class="star"></span> <span
                                                        class="star"></span> <span class="star"></span>
												</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2 >选择图标</h2>
                                <p>
                                    文件路径<br />[/web/src/main/webapp/WEB-INF/views/example/fontawesome/index.jsp与<br/>/web/src/main/webapp/WEB-INF/views/example/fontawesome/icon.jsp]
                                </p>
                                <div class="row">

                                    <label class="col-md-1  control-label" style="margin-top:2px;font-size:17px">图标：</label>
                                    <div class="col-md-4">
                                        <div class="input-group " id="icondiv">
                                            <label class="form-control-static"><i
                                                    class="fa ${sysResource.iconImg }"> ${sysResource.iconImg }</i></label>
                                            <span class="input-group-btn">
												<button type="button" class="btn btn-primary"
                                                        onclick="javascript:showIcon()">
													<i class="fa fa-search" /></i> 选择
												</button>
											</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">自定义css展示</h4>
                                        </div>
                                        <div class="modal-body" style="overflow-x:hidden;">
                                            <div class="tabbable-custom">

                                                .well {<br/>
                                                min-height: 20px;<br/>
                                                padding: 19px;<br/>
                                                margin-bottom: 20px;<br/>
                                                background-color: #f5f5f5;<br/>
                                                border: 1px solid #e3e3e3;<br/>
                                                border-radius: 4px;<br/>
                                                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);<br/>
                                                box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);<br/>
                                                }<br/>

                                                .rating {<br/>
                                                unicode-bidi: bidi-override;<br/>
                                                direction: rtl;<br/>
                                                font-size: 30px;<br/>
                                                }<br/>

                                                .rating span.star {<br/>
                                                font-family: FontAwesome;<br/>
                                                font-weight: normal;<br/>
                                                font-style: normal;<br/>
                                                display: inline-block;<br/>
                                                }<br/>

                                                .rating span.star:hover {<br/>
                                                cursor: pointer;<br/>
                                                }<br/>

                                                .rating span.star:before {<br/>
                                                content: "\f006";<br/>
                                                padding-right: 5px;<br/>
                                                color: #777777;<br/>
                                                }<br/>

                                                .rating span.star:hover:before, .rating span.star:hover ~ span.star:before<br/>
                                                {<br/>
                                                content: "\f005";<br/>
                                                color: #e3cf7a;<br/>
                                                }<br/>

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal -->
                            </div>




                        </div>
                    </div>

                </div>

        </div>




















	<%@ include file="icon.jsp"%>
	<critc-script> <script type="text/javascript">
	 function showIcon() {
         $('#iconModel').modal('show');
     }
	 function showIcon2() {
         $('#myModal').modal('show');
     }
        var icon;
        $("#iconModel").on("show.bs.modal",function(){
        	$("#iconModel a").css("color","black");
        });
        $("#iconModel").on("shown.bs.modal",function(){
        	  $("#iconModel .tab-pane div div").mouseover(function(){
        		  $(this).css("background","#D4D4D4");
        	  });
        	  $("#iconModel .tab-pane div div").mouseout(function(){
        		  $(this).css("background","");
        	  });
        	  $("#iconModel #web div").mouseover(function(){
        		  $(this).css("background","#D4D4D4");
        	  });
        	  $("#iconModel #web div").mouseout(function(){
        		  $(this).css("background","");
        	  });
        	  $("#iconModel .tab-content a").click(function(){
        		  icon=$(this).context.firstChild.classList[2];
        		  $('#iconModel').modal('hide');
        		  $('#iconImg').val(icon);
        	  });
        });
        $("#iconModel").on("hidden.bs.modal",function(){
        	if(icon==undefined)icon=[${sysResource.iconImg }];
        	$("#icondiv").empty();
        	$("#icondiv").append("<label class='form-control-static'><i class='fa "+icon+"'>"+"  "+icon+"</i></label><span class='input-group-btn'><button type='button' class='btn btn-primary' onclick='javascript:showIcon()''><i class='fa fa-search'/></i>选择</button></span>");
        });
   </script> </critc-script>
</body>