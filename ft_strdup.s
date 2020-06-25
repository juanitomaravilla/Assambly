# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juancarlosmartineznavas <juancarlosmart    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/13 17:24:26 by juancarlosm       #+#    #+#              #
#    Updated: 2020/03/13 19:51:06 by juancarlosm      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		global	_ft_strdup
				section.text
				extern	_malloc

_ft_strdup:
					cmp			rdi,0		; compara rdi = 0
					jz			checknull	; si es zero, salta a checknull
strlen:
					xor			rcx, rcx	; se declara rcx = i
					jmp			char		; salta a char
sum:
					inc			rcx			; rcx++
char:
					cmp			BYTE [rdi + rcx], 0 ; compara rdi[rcx] a 0
					jne			sum					; si no es igual, salta a suma e incrementa


malloc_start:
					inc			rcx					; rcx++
					push		rdi					; manda hacia arriba rdi otra vez para guardar el registro
					mov			rdi, rcx			; hace rdi[rcx]
					call		_malloc				; llama a la funcion malloc
					pop			rdi					; para guardar el registro otra vez
					cmp			rax, 0				; lo compara con cero
					jz			checknull			; si es cero salta a checknull

strcpy:
					xor			rcx, rcx			; declara rcx
					jmp			strcpyy				; salta a cpyy
while:
					inc		rcx						; entra en el bucle e incrementa rcx
strcpyy:
					mov		dl , byte [rdi + rcx]	; mete rdi[rcx] byte a byte en dl
					mov		byte [rax + rcx], dl	; mete de dl a rax[rcx] byte a byte
					cmp		dl, 0					; compara dl con zero
					jnz		while					; si no es cero va al bucle a incrementar
					jmp		return					; si no va al return

checknull:
					xor		rax,rax					; declara rax
return:
					ret
