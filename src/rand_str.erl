-module(rand_str).

%% API exports
-export([
    get/1
    ,get/2
]).

-define(ALPHABET, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0987654321+/").

%%====================================================================
%% API functions
%%====================================================================
get(Length) ->
    get(Length, ?ALPHABET).

get(Length, Alphabet) when length(Alphabet) > 0 ->
    L = length(Alphabet),
    lists:foldl(fun(_, Acc) ->
                    [lists:nth(rand:uniform(L), Alphabet)] ++ Acc
                end, [], lists:seq(1, Length)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                     Eunit Tests                                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

base64_compatibility_test() ->
    Sample = ?MODULE:get(2048),
    ?assertEqual(Sample, binary_to_list(base64:decode(base64:encode(Sample)))).

empty_alphabet_fails_test() ->
    ?assertError(function_clause, ?MODULE:get(16, "")).

custom_alphabet_test() ->
    Alphabet = "aç0R|)4!'-'",
    Length = 256,
    Str = ?MODULE:get(Length, Alphabet),
    Fold = lists:foldl(fun(Letter, Truth) ->
                            Truth andalso lists:member(Letter, Alphabet)
                        end, true, Str),
    ?assert(Fold),
    ?assertEqual(Length, length(Str)).

-endif.
