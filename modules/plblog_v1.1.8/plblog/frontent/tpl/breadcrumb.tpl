<div class="breadcrumb">
	<a href="{$base_dir}" title="{l s='return to' mod='plblog'} {l s='Home' mod='plblog'}">{l s='Home' mod='plblog'}</a>
	{$length = $pl_path|@count}
	{if $length > 0}
		{$i = 0}
		{foreach from=$pl_path item=path}
			{$i = $i + 1}
			{if $i < $length}
				<span class="navigation-pipe">&gt;</span>
				<a title="{$path['name']}" href="{$path['link']}">{$path['name']}</a>
			{/if}
			{if $i >= $length}
				<span class="navigation-pipe">&gt;</span>	
				{$path['name']}
			{/if}
		{/foreach}
	{/if}	
</div>

{*
<div class="breadcrumb">
	<a href="{$base_dir}" title="{l s='return to' mod='plblog'} {l s='Home' mod='plblog'}">{l s='Home' mod='plblog'}</a>
	{if isset($path) AND $path}
		<span class="navigation-pipe">{$navigationPipe|escape:html:'UTF-8'}</span>
		{if !$path|strpos:'span'}
			<span class="navigation_page">{$path}</span>
		{else}
			{$path}
		{/if}
	{/if}
</div>
*}