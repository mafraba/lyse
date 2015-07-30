-module(event).
-compile(export_all).

-record(state, {server, name="", to_go=0}).


loop(S = #state{server=Server,to_go=Delay}) ->
  receive
    {Server, Ref, cancel} -> Server ! {Ref, ok}
  after Delay*1000 ->
    Server ! {done, S#state.name}
end.