<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;

class TestController
{
    public function lucky()
    {
        $number = random_int(0, 100);

        return new Response(
            '<html><body>Lucky number: ' . $number . '</body></html>'
        );
    }

    public function pgSensors()
    {
        
    }
}
