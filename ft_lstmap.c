/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adesmet <adesmet@student.s19.be>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/01 02:44:46 by adesmet           #+#    #+#             */
/*   Updated: 2021/02/03 08:02:02 by adesmet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*ans;

	if (!lst || !f || !del)
		return (NULL);
	if (!(ans = ft_lstnew(lst->content)))
	{
		ft_lstclear(&lst,del);
		return (NULL);
	}	
	ans->content = f(lst->content);
	ans->next = ft_lstmap(lst->next, f, del);
	return (ans);
}
