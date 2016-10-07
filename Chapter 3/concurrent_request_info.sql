select r.request_id "Request ID",
   s.sid "Session ID" ,
   g.concurrent_program_name "Concurrent Program"
from applsys.fnd_concurrent_requests r,
   applsys.fnd_concurrent_queues_tl qt,
   applsys.fnd_concurrent_queues q,
   applsys.fnd_concurrent_processes p,
   applsys.fnd_concurrent_programs g,
   v$session s
where r.controlling_manager=p.concurrent_process_id
   and q.application_id=p.queue_application_id
   and q.concurrent_queue_id=p.concurrent_queue_id
   and qt.application_id=q.application_id
   and qt.concurrent_queue_id=q.concurrent_queue_id
   and r.phase_code='R'
   and qt.language in ('US')
   and p.session_id=s.audsid
   and g.concurrent_program_id = r.concurrent_program_id
   and r.request_id = &request_id
