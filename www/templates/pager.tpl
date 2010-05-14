{if $pagertotalitems > $pageritemsperpage}
	{section name=pager loop=$pagertotalitems start=0 step=$pageritemsperpage}
		{if $pageroffset == $smarty.section.pager.index}
			{$smarty.section.pager.iteration}&nbsp;
		{elseif $pageroffset-$smarty.section.pager.index == $pageritemsperpage || 
					$pageroffset+$pageritemsperpage == $smarty.section.pager.index}
		<a title="Goto page {$smarty.section.pager.iteration}" href="{$pagerquerybase}{$smarty.section.pager.index}{$pagerquerysuffix}">{$smarty.section.pager.iteration}</a>&nbsp;
		{elseif ($pagertotalitems-($smarty.section.pager.index+$pageritemsperpage)) < 0}
		... <a title="Goto last page" href="{$pagerquerybase}{$smarty.section.pager.index}{$pagerquerysuffix}">{$smarty.section.pager.iteration}</a>
		{elseif ($smarty.section.pager.iteration == 1)}
			<a title="Goto first page" href="{$pagerquerybase}0{$pagerquerysuffix}">1</a> ... 
		{/if}    
	{/section}
{/if}  