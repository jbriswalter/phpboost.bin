<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
	<head>
		<title>{$title}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<link rel="stylesheet" type="text/css" href="{$subdir}media/style.css" />
	</head>
	<body>
		<div id="header_top"><a name="top">{$package}</a></div>
		<div class="horizontal-menu">
			{assign var="packagehaselements" value=false}
			{foreach from=$packageindex item=thispackage}
			    {if in_array($package, $thispackage)}
			        {assign var="packagehaselements" value=true}
			    {/if}
			{/foreach}
			{if $packagehaselements}
			   [ <a href="{$subdir}classtrees_{$package}.html" class="menu">class tree: {$package}</a> ]
			   [ <a href="{$subdir}elementindex_{$package}.html" class="menu">index: {$package}</a> ]
			{/if}
		    [ <a href="{$subdir}elementindex.html" class="menu">all elements</a> ]
		</div>
		
		<table id="main">
		    <tr>
		        <td id="menu">
		            <div class="menu">
						{if count($ric) >= 1}
							<div id="ric">{section name=ric loop=$ric}<p><a href="{$subdir}{$ric[ric].file}">{$ric[ric].name}</a></p>{/section}</div>
						{/if}
						{if $hastodos}
							<div id="todolist"><p><a href="{$subdir}{$todolink}">Todo List</a></p></div>
						{/if}
						<h3>Packages:</h3>
						{section name=packagelist loop=$packageindex}
						     <a href="{$subdir}{$packageindex[packagelist].link}">{$packageindex[packagelist].title}</a><br />
						{/section}
						{if $tutorials}
							<h3>Tutorials/Manuals:</h3>
							{if $tutorials.pkg}
								<h3>Package-level:</h3>
								{section name=ext loop=$tutorials.pkg}{$tutorials.pkg[ext]}{/section}
							{/if}
							{if $tutorials.cls}
								<h3>Class-level:</h3>
								{section name=ext loop=$tutorials.cls}{$tutorials.cls[ext]}{/section}
							{/if}
							{if $tutorials.proc}
								<h3>Procedural-level:</h3>
								{section name=ext loop=$tutorials.proc}{$tutorials.proc[ext]}{/section}
							{/if}
						{/if}
						{if !$noleftindex}{assign var="noleftindex" value=false}{/if}
							{if !$noleftindex}
							{if $compiledinterfaceindex}
								<hr /><h3>Interfaces:</h3>
								{eval var=$compiledinterfaceindex}
							{/if}
							
							{if $compiledclassindex}
							    <hr /><h3>Classes:</h3>
							    {eval var=$compiledclassindex}
							{/if}
								
							{if $compiledfileindex}
							    <hr /><h3>Files:</h3>
								{eval var=$compiledfileindex}
						    {/if}
						{/if}
					</div>
		        </td>
			    <td id="content">
					{if !$hasel}{assign var="hasel" value=false}{/if}
					{if $hasel}<h1>{$eltype|capitalize}: {$class_name}</h1><p>Source Location: {$source_location} [line {if $class_slink}{$class_slink}{else}{$line_number}{/if}]</p>{/if}